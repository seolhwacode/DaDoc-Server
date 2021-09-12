package com.team1.dadoc.users.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.users.dao.UsersDao;
import com.team1.dadoc.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao dao;

	//inputId 와 같은 id 가 DB 에 존재하는지 여부 Map 으로 return
	@Override
	public Map<String, Object> isIdExist(String inputId) {
		//Map 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		//isExist 라는 키값으로 아이디가 존재하는지 여부를 담는다.
		map.put("isExist", dao.isIdExist(inputId));
		//Map 객체를 리턴해준다.
		return map;
	}
	
	//inputNick 과 같은 nickname 이 DB 에 존재하는지 여부 Map 으로 return
	@Override
	public Map<String, Object> isNickExist(String inputNick) {
		//Map
		Map<String, Object> map = new HashMap<String, Object>();
		//isExist 라는 키앖으로 닉네임이 존재하는지 여부를 담는다.
		map.put("isExist", dao.isNickExist(inputNick));
		//Map 객체 리턴
		return map;
	}

	//UsersDto 의 내용을 db 에 추가 - 비밀번호 암호화 추가
	@Override
	public boolean addUser(UsersDto dto) {
		//사용자가 입력한 비밀번호 읽어오기
		String pwd = dto.getPwd();
		
		//암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(pwd);
		
		//dto 에 다시 넣어줌
		dto.setPwd(encodedPwd);
		
		//기본 프로필 사진 random 으로 1~4 사이의 파일로 지정
		Random random = new Random();
		int randNum = random.nextInt(4) + 1;
		
		//-> /resources/images/profile01 ~ 4
		String profile = "/resources/images/profile0" + randNum + ".png";
		
		//dto 에 profile 추가
		dto.setProfile(profile);
		
		//db 에 insert
		boolean isSuccess = dao.insertUser(dto);
		
		return isSuccess;
	}

	//dto 의 id/pwd 의 값이 db 에 일치하는 값이 있는지 확인 및 로그인(session)
	@Override
	public boolean loginProcess(UsersDto dto, HttpSession session) {
		//1. 로그인 폼에 입력한 아이디를 이용해서 해당 정보를 select 
		UsersDto result = dao.getData(dto.getId());
		
		//isValid : 입력한 정보가 맞는지 여부
		boolean isValid = false;
		
		//2. select 된 정보가 없으면 -> null -> 로그인 실패
		if(result != null) {
			//존재하는 id
			//비밀번호가 일치하는지 확인
			//암호화 되어 있기 때문에, BCrypt 객체를 사용해서 검사한다. -> true / false 리턴
			isValid = BCrypt.checkpw(dto.getPwd(), result.getPwd());
		}
		
		//3. isValid == true 면 -> 비밀번호가 일치한다.
		//-> 로그인 처리 : session 에 "id" 라는 키값으로 아이디를 담는다.
		if(isValid) {
			//유효하다 : 비밀번호가 일치
			session.setAttribute("id", dto.getId());
			//navbar 에 넣을 사용자 사진을 session 에 저장
			session.setAttribute("userProfile", result.getProfile());
			
			//성공함을 return
			return true;
		}
		//여기에 오면 실패인 것
		return false;
	}

	//inputId 에 해당하는 data 를 읽어와서 해당 질문과 inputId를 mView 에 넣어준다.
	@Override
	public void getPwdQuestion(ModelAndView mView, String inputId) {
		//id 를 mView 에 넣어준다.
		mView.addObject("id", inputId);
		//db에서 inputId 에 해당하는 qwd_question 을 읽어온다.
		String question = dao.getQuestion(inputId);
		//mView 에 읽어온 질문을 넣는다.
		mView.addObject("question", question);
	}

	//비밀번호 찾기 - id 와 작성 답변을 통해 질문의 답이 맞는지 체크한다.
	@Override
	public boolean checkAnswer(String id, String answer) {
		//db 에서 답변이 맞는지 체크하기위해 답변을 읽어온다.
		String correctAnswer = dao.getAnswer(id);
		//db 에서 읽어온 정답과, 입력한 답의 빈칸을 전부 업애고 검사한다.
		String correctAnswer2 = correctAnswer.replaceAll(" ", "");
		String answer2 = answer.replaceAll(" ", "");
		//답이 일치하면 -> true
		if(answer2.equals(correctAnswer2)) {
			return true;
		}		
		//일치하지 X -> false
		return false;
	}

	//새로운 비밀번호를 생성하고, db 에 pwd 를 갱신한 후, 새로 생성한 pwd plain text 를 mView 에 담기
	@Override
	public void createNewRPwd(ModelAndView mView, String id) {
		//랜덤 문자열로 비밀번호 생성하기
		// 숫자, 영어 대문자, 영서 소문자로 이루어진 문자열 만들기
		int leftLimit = 48; // numeral '0'
		int rightLimit = 122; // letter 'z'
		//랜덤으로 5 ~ 10 사이의 수 만들기 -> 비밀번호의 길이는 5 ~ 10 글자이다.
		Random random = new Random();
		int targetStringLength = random.nextInt(6) + 5;
		
		//랜덤 문자열 생성
		String newPwd = random.ints(leftLimit,rightLimit + 1)
		  .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
		  .limit(targetStringLength)
		  .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
		  .toString();

		//비밀번호 암호화하기
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(newPwd);
		
		//UsersDto 를 생성
		UsersDto dto = new UsersDto();
		//id, encodedPwd 를 담기
		dto.setId(id);
		dto.setPwd(encodedPwd);
		
		//비밀번호 DB에 반영하기
		dao.updatePwd(dto);
		
		//System.out.println(newPwd);
		//사용자에게는 plain text 를 전달해준다.
		mView.addObject("newPwd", newPwd);
	}

	//id 에 해당하는 pwd 를 제외한 정보를 모두 읽어와, UsersDto 로 return
	@Override
	public UsersDto getUserDataAll(String id) {
		return dao.getData(id);
	}

	@Override
	public Map<String, Object> getQuestion(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("question", dao.getQuestion(id));
		return map;
	}

	//프로필 사진을 바꿀 때, upload 폴더에 upload 하기 - imagePath(/upload/실제파일이름) 리턴
	@Override
	public Map<String, Object> uploadProfile(MultipartFile image, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//원본 파일명 -> 저장할 파일 이름 만들기위해서 사용됨
		String orgFileName = image.getOriginalFilename();
		//파일 크기 -> 다운로드가 없으므로, 여기서는 필요 없다.
		long fileSize = image.getSize();
		
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		//db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload = new File(filePath);
		if(!upload.exists()) {
			//만약 디렉토리가 존재하지X
			upload.mkdir();//폴더 생성
		}
		//저장할 파일의 이름을 구성한다. -> 우리가 직접 구성해줘야한다.
		String saveFileName = System.currentTimeMillis() + orgFileName;
		
		try {
			//upload 폴더에 파일을 저장한다.
			image.transferTo(new File(filePath + saveFileName));
			System.out.println(filePath + saveFileName);	//임시 출력
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//map 에 업로드된 파일의 정보를 담는다.
		//-> 추가할 것 : imagePath (실제 업로드 path)
		map.put("imagePath", "/upload/" + saveFileName);
		
		return map;
	}

	@Override
	public boolean deleteUploadProfile(String imagePath, HttpServletRequest request) {
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일 시스템 상에서의 경로)
		String realPath = request.getServletContext().getRealPath("/upload");
		
		//db 에 저장할 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		//파일을 찾을 디렉토리 File 객체 생성
		File upload = new File(filePath);
		//폴더가 존재 X -> 아무 일도 없음 -> return
		if(!upload.exists()) {
			return false;
		}
		//가장 뒤에 있는 / 의 위치를 구한다. -> 그 자리 index + 1 의 자리부터 잘라낸다.
		String saveFileName = imagePath.substring(imagePath.lastIndexOf('/') + 1);
		
		System.out.println(saveFileName);
		System.out.println(filePath + saveFileName);
		
		//삭제할 파일 객체
		File deleteFile = new File(filePath + saveFileName);
		//해당 파일 있음 -> 삭제
		if(deleteFile.exists()) {
			//존재하면 -> 삭제
			if(deleteFile.delete()) {
				return true;
			}else {
				return false;
			}
		}
		return false;
	}

	//프로필(profile)을 db 에 수정 반영한다.
	@Override
	public void updateProfile(UsersDto dto) {
		dao.updateProfile(dto);
	}

	//id 와, 입력한 비밀번호가 맞는지 확인 여부 return
	@Override
	public boolean pwdCheck(UsersDto dto) {
		//1. dto 의 아이디를 이용해서 해당 정보를 select 
		UsersDto result = dao.getData(dto.getId());
		
		//isValid : 입력한 정보가 맞는지 여부
		boolean isValid = false;
		
		//2. select 된 정보가 없으면 -> null -> false
		//id 가 존재 -> 비밀번호 체크 -> true / false
		if(result != null) {
			//존재하는 id
			//비밀번호가 일치하는지 확인
			//암호화 되어 있기 때문에, BCrypt 객체를 사용해서 검사한다. -> true / false 리턴
			isValid = BCrypt.checkpw(dto.getPwd(), result.getPwd());
		}

		//확인 값 return
		return isValid;
	}

	//사용자의 정보를 수정한다.
	@Override
	public void update(UsersDto dto) {
		//사용자의 정보를 수정한다.
		dao.updateUserData(dto);
	}

	@Override
	public boolean pwdUpdate(UsersDto dto, HttpSession session) {
		//id 로 현재 입력한 비밀번호가 실제로 일치하는지 확인		
		if(!pwdCheck(dto)) {
			//비밀번호가 일치하지 않음
			return false;
		}
		
		//변경할 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPwd = encoder.encode(dto.getNewPwd());
		
		//db update 를 위해 pwd 에 넣기
		dto.setPwd(encodedPwd);
		
		//db update
		try {
			dao.updatePwd(dto);
		}catch(Exception e) {
			System.out.println("비밀번호 변경 오류");
			return false;
		}
		//변경 후에 session id 삭제 -> 자동 로그아웃
		session.removeAttribute("id");
		session.removeAttribute("userProfile");
		
		//변경 성공 -> true
		return true;
		
	}

	//회원 탈퇴하기 : id 에 해당하는 사용자 정보 삭제 -> 사용자 id 삭제 된 것을 확인 -> 결과 boolean 값으로 리턴
	@Override
	public boolean leave(HttpSession session) {
		//session id
		String id = (String)session.getAttribute("id");
		//id 에 해당하는 회원이 존재하는지 확인
		if(!dao.isIdExist(id)) {
			//아이디 존재 x -> false
			return false;
		}
		//id 존재 -> db 에서 삭제
		//db 에서 삭제
		dao.deleteUser(id);
		//로그아웃
		session.removeAttribute("id");
		session.removeAttribute("userProfile");
		
		//id 에 해당하는 회원이 존재하는지 확인
		if(!dao.isIdExist(id)) {
			//아이디 존재 x -> 성공
			return true;
		}else {
			//아이디 존재 o -> 실패
			return false;
		}
	}

}
