package com.team1.dadoc.challenge.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.challenge.service.ChallengeService;
import com.team1.dadoc.challenger.dto.ChallengerDto;
import com.team1.dadoc.challenges.dto.ChallengesDto;
import com.team1.dadoc.photoshot.dto.PhotoShotDto;


@Controller
public class ChallengeController {
	
	@Autowired
	private ChallengeService service;
	
	@RequestMapping(value="/challenge/main")
	public String getList(HttpServletRequest request) {
		
		service.getList(request);
		return "challenge/main";
	}
	
	// 챌린지 업로드 & DB 저장
	@RequestMapping(value="/challenge/register_form")
	public ModelAndView registerForm(HttpServletRequest request) {
		return new ModelAndView("challenge/register_form");
	}
	
	// 챌린지 DB에 집어넣기 
	@RequestMapping(value="/challenge/register")
	public ModelAndView register(ChallengesDto dto, ModelAndView mView, HttpServletRequest request) {		
		// form에서 dto로 데이터 받아오고
		// dto: challenge 정보와 MultipartFile image 정보를 가지고 있다.
		// request : imagePath 만드는데 사용, session 영역의 id 가져오기
		service.saveImage(dto, request);
		mView.setViewName("redirect:/challenge/main.do");
		
		return mView;
		
	}
	
	// 챌린지 상세보기 (detail 페이지)
	// 게시글의 num이 parameter get 방식으로 넘어온다.
	@RequestMapping(value="/challenge/detail", method= RequestMethod.GET)
	public ModelAndView detail(ModelAndView mView, @RequestParam int num) {
		//detail 페이지에 필요한 data를 num을 통해 가져와서 ModelAndView에 저장
		service.getDetail(mView,num);
		mView.setViewName("challenge/detail");
		
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
		mView.setViewName("redirect:/challenge/detail.do?num="+detailNum); //detail 페이지에 다시 데려오기
		
		return mView;
	}
}