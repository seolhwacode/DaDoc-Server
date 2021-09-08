package com.team1.dadoc.challenge.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.challenge.service.ChallengeService;
import com.team1.dadoc.challenger.dto.ChallengerDto;
import com.team1.dadoc.challenges.dto.ChallengesCommentDto;
import com.team1.dadoc.challenges.dto.ChallengesDto;
import com.team1.dadoc.photoshot.dto.PhotoShotDto;


@Controller
public class ChallengeController {
	
	@Autowired
	private ChallengeService service;
	
	// 메인페이지에 챌린지 목록 가져오기
	@RequestMapping(value="/challenge/main")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		return "challenge/main";
	}
	
	// 챌린지 업로드 & DB 저장
	@RequestMapping(value="/challenge/private/register_form")
	public ModelAndView registerForm(HttpServletRequest request) {
		return new ModelAndView("challenge/private/register_form");
	}
	
	// 챌린지 DB에 집어넣기 
	@RequestMapping(value="/challenge/private/register")
	public ModelAndView register(ChallengesDto dto, ModelAndView mView, HttpServletRequest request) {		
		// form에서 dto로 데이터 받아오고
		// dto: challenge 정보와image 정보를 가지고 있다.
		// request : imagePath 만드는데 사용, session 영역의 id 가져오기
		service.register(dto, request);
		mView.setViewName("redirect:/challenge/main.do");
		
		return mView;
		
	}
	
	//ajax 프로필 사진 업로드 요청처리
	@RequestMapping(value="/challenge/private/ajax_image_upload", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxProfileUpload(HttpServletRequest request, @RequestParam MultipartFile preImage){
		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map을 json 문자열로 리턴하기
		return service.saveImage(request, preImage);
	}
	
	// 챌린지 상세보기 (detail 페이지)
	// 게시글의 num이 parameter get 방식으로 넘어온다.
	@RequestMapping(value="/challenge/private/detail", method= RequestMethod.GET)
	public ModelAndView detail(HttpServletRequest request, ModelAndView mView, @RequestParam int num, @RequestParam String title) {
		//detail 페이지에 필요한 data를 num을 통해 가져와서 ModelAndView에 저장
		
		service.getDetail(mView,num);
		service.getChallenger(mView, title);
		String id = request.getSession().getId();
		PhotoShotDto dto = new PhotoShotDto();
		dto.setId(id);
		dto.setChallengeTitle(title);
		service.getPhotoShot(mView, dto);
		mView.setViewName("challenge/private/detail");
		
		return mView;
	}
	
	//댓글 수정 요청처리 (JSON 응답으로)
	@RequestMapping("/challenge/private/comment_update")
	@ResponseBody
	public Map<String, Object> commentUpdate(ChallengesCommentDto dto, HttpServletRequest request){
		service.updateComment(dto);
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다.
		return map;
	}
	
	//댓글 삭제 요청처리
	@RequestMapping("/challenge/private/comment_delete")
	@ResponseBody
	public Map<String, Object> commentDelete(HttpServletRequest request){
		service.deleteComment(request);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isSuccess", true);
		//{"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다.
		return map;
	}
	
	//새로운 댓글 저장 요청처리
	@RequestMapping("/challenge/private/comment_insert")
	public ModelAndView commentInsert(HttpServletRequest request,
			@RequestParam int ref_group, @RequestParam String title){
		service.saveComment(request);
		return new ModelAndView("redirect:/challenge/private/detail.do?num="+ref_group+"&title="+title);
	}
	
	//댓글 더보기 요청처리
	@RequestMapping("/challenge/private/ajax_comment_list")
	public String ajaxCommentList(HttpServletRequest request) {
		service.moreCommentList(request);
		return "challenge/private/ajax_comment_list";
	}
	
	//챌린시 수정 폼 요청 처리
	@RequestMapping("/challenge/private/update_form")
	public ModelAndView updateForm(HttpServletRequest request, ModelAndView mView,
				@RequestParam int num) {
		
		//getData를 통해 수정 요청한 해당 정보를 가져온다.
		service.getDetail(mView, num);
		
		mView.setViewName("challenge/private/update_form");
		return mView;
	}
	
	//챌린지 수정 하기
	@RequestMapping(value="/challenge/private/update", method= RequestMethod.POST)
	public ModelAndView update(ChallengesDto dto, HttpServletRequest request) {
		service.updateChallenge(dto);
		return new ModelAndView("challenge/private/update");
	}
	
	//챌린지 삭제하기
	@RequestMapping("/challenge/private/delete")
	public ModelAndView delete(HttpServletRequest request, ModelAndView mView,
				@RequestParam int num) {
		service.deleteChallenge(num, request);
		
		mView.setViewName("redirect:/challenge/main");
		return mView;
	}
	
	// 챌린지 신청하기
	@RequestMapping(value="/challenge/insertChallenger")
	public ModelAndView Insert(ChallengerDto dto, ModelAndView mView, HttpServletRequest request) {
		
		//글 작성자는 session에서 얻어낸다 (로그인 처리 기능 완료 후 만들 예정)
		
		//ChallengeDto 객체에 id 정보 담기 dto.setWriter(id);
		service.saveChallenger(dto, request);
		mView.setViewName("challenge/main"); // 마이페이지로 이동하게 하기 
		return mView;
	}
	
	//인증샷 업로드 요청 처리 
	@RequestMapping(value="/challenge/photoShot_upload.do")
	public ModelAndView uploadPhotoShot(PhotoShotDto dto, ModelAndView mView,HttpServletRequest request) {
		// form에서 dto로 데이터 받아오고
		// dto: 인증샷 정보와 MultipartFile image 정보를 가지고 있다.
		// request : imagePath 만드는데 사용, session 영역의 id 가져오기
		service.savePhotoShot(dto, request);
		// 상세 정보글의 번호 담아주기
		int detailNum = dto.getNum();
		mView.setViewName("redirect:/challenge/private/detail.do?num="+detailNum); //detail 페이지에 다시 데려오기
		
		return mView;
	}
}