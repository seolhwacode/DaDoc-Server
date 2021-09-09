package com.team1.dadoc.challenge.service;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.challenger.dao.ChallengerDao;
import com.team1.dadoc.challenger.dto.ChallengerDto;
import com.team1.dadoc.challenges.dao.ChallengesCommentDao;
import com.team1.dadoc.challenges.dao.ChallengesDao;
import com.team1.dadoc.challenges.dto.ChallengesCommentDto;
import com.team1.dadoc.challenges.dto.ChallengesDto;
import com.team1.dadoc.photoshot.dao.PhotoShotDao;
import com.team1.dadoc.photoshot.dto.PhotoShotDto;

@Service
public class ChallengeServiceImpl implements ChallengeService {

	@Autowired
	private ChallengesDao challengesDao;
	@Autowired
	private ChallengerDao challengerDao;
	@Autowired
	private PhotoShotDao photoShotDao;
	@Autowired
	private ChallengesCommentDao commentDao;
	
	// 새로운 챌린지 등록하는 메소드
	@Override
	public void register(ChallengesDto dto, HttpServletRequest request) {
		//dto에 챌린지 정보와 imagePath를 가지고 있다.
		challengesDao.register(dto);
	}
	
	// 챌린지 리스트 가져오는 메소드
	@Override
	public void getList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=8;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		   
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
			   
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		
		/*
		[ 검색 키워드에 관련된 처리 ]
		-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.		
		*/
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		//카테고리 키워드가 파라미터로 넘어올 수도 있으니 변수에 담기
		String category_name=request.getParameter("category_name");
		//만일 키워드가 넘어오지 않는다면 
		if(keyword==null){
			//키워드와 검색 조건에 빈 문자열을 넣어준다. 
			//클라이언트 웹브라우저에 출력할때 "null" 을 출력되지 않게 하기 위해서  
			keyword="";
			condition=""; 
		}		
		if(category_name==null) {
			category_name="";
		}
		//특수기호를 인코딩한 키워드를 미리 준비한다. 
		String encodedK=URLEncoder.encode(keyword);
			
		//CafeDto 객체에 startRowNum 과 endRowNum 을 담는다.
		ChallengesDto dto=new ChallengesDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
	
		//만일 검색 키워드가 넘어온다면 
		if(!keyword.equals("")){
			//검색 조건이 무엇이냐에 따라 분기 하기
			if(condition.equals("title_content")){//제목 + 내용 검색인 경우
				//검색 키워드를 CafeDto 에 담아서 전달한다.
				dto.setTitle(keyword);
				dto.setDescription(keyword);
			}else if(condition.equals("title")){ //제목 검색인 경우
				dto.setTitle(keyword);
			}else if(condition.equals("writer")){ //작성자 검색인 경우
				dto.setWriter(keyword);
			} // 다른 검색 조건을 추가 하고 싶다면 아래에 else if() 를 계속 추가 하면 된다.
		}
		
		//만약 카테고리 선택이 되었다면
		if(!category_name.equals("")) {
			dto.setCategory(category_name);
		}
		//ChallengesDto 객체를 이용해서 챌린지 목록을 얻어온다.
		List<ChallengesDto> list = challengesDao.getList(dto);
				
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
		//전체 row 의 갯수
		int totalRow = challengesDao.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum = totalPageCount; //보정해 준다. 
		}
		
		//view page 에서 필요한 값을 request 에 담아준다. 
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("condition", condition);
		request.setAttribute("category_name", category_name);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("list", list);
		request.setAttribute("totalRow", totalRow);
	}
	
	@Override
	public Map<String,Object> saveImage(HttpServletRequest request, MultipartFile mFile) {
		//원본 파일명 -> 저장할 파일 이름 만들기 위해서 사용됨
		String orgFileName = mFile.getOriginalFilename();
		//upload폴더에 저장할 파일명을 직접 구성한다.
		//1234123424343xxx.jpg
		String saveFileName=System.currentTimeMillis()+orgFileName;
		
		// webapp/uplaod 폴더까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(realPath);
		if(!upload.exists()) {
			//만약 디렉토리가 존재하지 않는다면
			upload.mkdir(); // 폴더 생성
		}		
		try{
			//파일을 저장할 전체 경로를 구성한다.  
			String savePath=realPath+File.separator+saveFileName;
			//임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
			mFile.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		// json 문자열을 출력하기 위한 Map 객체 생성하고 정보 담기 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", "/upload/"+saveFileName);
		
		return map;
	}

	// 챌린지 detail 페이지에 필요한 data를 ModelAndView에 저장
	@Override
	public void getDetail(ModelAndView mView, int num) {
		//challengesDao로 해당 게시글 num에 해당하는 데이터를 가져온다.
		ChallengesDto dto = challengesDao.getData(num);
				
		//[댓글 관련 로직]
		
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT = 10;
		//detail 페이지에서는 항상 1페이지의 댓글 내용만 출력한다.
		int pageNum=1;
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//원글의 글번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		ChallengesCommentDto commentDto = new ChallengesCommentDto();
		commentDto.setRef_group(num);
		//1페이지에 해당하는 startRowNum과 endRowNum을 dto에 담아서
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		
		//1페이지에 해당하는 댓글 목록만 select 되도록 한다.
		List<ChallengesCommentDto> commentList = commentDao.getList(commentDto);
		
		
		//원글의 글 번호를 이용해서 댓글 전체 갯수 얻어오기
		int totalRow = commentDao.getCount(num);
		//댓글 전체 페이지 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//view에 필요한 값 담아주기
		mView.addObject("dto", dto);
		mView.addObject("commentList", commentList);
		mView.addObject("totalPageCount", totalPageCount);
		mView.addObject("pageRowCount", PAGE_ROW_COUNT);
		mView.addObject("totalRow", totalRow);
	}

	@Override
	public void saveChallenger(ChallengerDto dto, HttpServletRequest request) {
		challengerDao.insert(dto);
	}

	@Override
	public void savePhotoShot(PhotoShotDto dto, HttpServletRequest request) {
		//업로드된 파일의 정보를 가지고 있는 MultipartFile 객체의 참조값 가져오기
		MultipartFile image = dto.getImage();
		//원본 파일명 -> 저장할 파일 이름 만들기 위해서 사용됨
		String orgFileName = image.getOriginalFilename();
		//파일 크기 -> 다운로드가 없으므로, 여기서는 필요없다.
		long fileSize = image.getSize();
				
		// webapp/uplaod 폴더까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		// db에 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if(!upload.exists()) {
			//만약 디렉토리가 존재하지 않는다면
			upload.mkdir(); // 폴더 생성
			}
			//저장할 파일의 이름을 구성한다.
			String saveFileName = System.currentTimeMillis()+orgFileName;
			
			try{
				//upload 폴더에 파일을 저장한다.
				image.transferTo(new File(filePath+saveFileName));
			}catch(Exception e) {
				e.printStackTrace();
			}
				
			dto.setImagePath("/upload/"+saveFileName);
				
			//ChallengeschallengesDao를 이용해서 DB에 저장하기
			photoShotDao.insert(dto);	
	}

	@Override
	public void getPhotoShot(ModelAndView mView, PhotoShotDto dto) {
		//PhotoShotDao로 해당 게시글 num에 해당하는 데이터를 가져온다.
		List<PhotoShotDto> photoList = photoShotDao.getPhotoShot(dto);
		//ModelAndView에 가져온 Dto를 담는다.
		mView.addObject("photoList", photoList);		
	}

	@Override
	public void deleteChallenge(int num, HttpServletRequest request) {
		challengesDao.delete(num);
	}

	@Override
	public void updateChallenge(ChallengesDto dto) {
		challengesDao.update(dto);
	}
	
	//새로운 댓글을 저장하기
	@Override
	public void saveComment(HttpServletRequest request) {
		//폼 전송되는 파라미터 추출
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		String target_id=request.getParameter("target_id");
		String content=request.getParameter("content");
		/*
		 * 원글의 댓글은 comment_group번호가 전송이 안되고
		 * 댓글의 댓글은 comment_group번호가 전송이 된다.
		 * 따라서 comment_group의 null 여부에 따라 댓글의 종류를 판단할 수 있다.
		 */
		String comment_group=request.getParameter("comment_group");
		
		//댓글 작성자는 session영역에서 얻어내기
		String writer=(String)request.getSession().getAttribute("id");
		//댓글의 시퀀스 번호 미리 얻어내기
		int seq=commentDao.getSequence();
		//저장할 댓글의 정보를 dto에 담기
		ChallengesCommentDto dto = new ChallengesCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		//원글의 댓글인 경우
		if(comment_group==null) {
			//댓글의 글 번호를 comment_group번호로 사용한다.
			dto.setComment_group(seq);
		}else {
			//전송된 comment_group번호를 숫자로 바꿔서 dto에 넣어준다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		//댓글 정보를 DB에 저장하기
		commentDao.insert(dto);
	}

	@Override
	public void updateComment(ChallengesCommentDto dto) {
		commentDao.update(dto);
	}

	@Override
	public void deleteComment(HttpServletRequest request) {
		int num= Integer.parseInt(request.getParameter("num"));
		commentDao.delete(num);
	}
	

	@Override
	public void moreCommentList(HttpServletRequest request) {
		//로그인된 아이디
		String id = (String)request.getSession().getAttribute("id");
		//ajax 요청 파라미터 넘어오는 댓글의 페이지 번호를 읽어낸다. -> ajax처리할 때 get방식으로 넘겨줌
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		//ajax 요청 파라미터로 넘어오는 원글의 글 번호를 읽어낸다.
		int num = Integer.parseInt(request.getParameter("num"));
		/*
		 * [댓글 페이징 처리 관련 로직]
		 */
		//한 페이지에 몇개씩 표시할 것인지?
		final int PAGE_ROW_COUNT = 10;
		
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//원글의 글 번호를 이용해서 해당글에 달린 댓글 목록을 얻어온다.
		ChallengesCommentDto commentDto= new ChallengesCommentDto();
		commentDto.setRef_group(num);
		
		//1페이지에 해당하는 startRowNum과 endRowNum을 dto에 담아서
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		
		//pageNum에 해당하는 댓글 목록만 select 되도록 한다.
		List<ChallengesCommentDto> commentList= commentDao.getList(commentDto);
		//원글의 글 번호를 이용해서 댓글 전체의 갯수를 얻어낸다.
		int totalRow=commentDao.getCount(num);
		//댓글 전체 페이지의 갯수
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//view page에 필요한 값 request에 담아주기
		request.setAttribute("commentList", commentList);
		request.setAttribute("num", num); //원글의 글번호
		request.setAttribute("pageNum", pageNum); //댓글의 페이지 번호
		
	}

	@Override
	public void getChallenger(ModelAndView mView, String title) {
		int challengers = challengerDao.getChallengers(title);
		mView.addObject("challengers", challengers);
	}

	@Override
	public void checkChallenge(HttpServletRequest request) {
		//Session에서 id 가져오기
		String id = (String)request.getSession().getAttribute("id");
		//ChallengesDto 객체를 이용해서 내가 만든 챌린지 목록을 얻어온다.
		List<ChallengesDto> myList = challengesDao.getMyList(id);
		//ChallengerDto 객체를 이용해서 내가 참여한 챌린지 목록을 얻어온다.
		List<ChallengerDto> myChallenge = challengerDao.getMyChallenge(id);
		//request 영역에 담아주기
		request.setAttribute("myList", myList);
		request.setAttribute("myChallenge", myChallenge);
	}






	
}