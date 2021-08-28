package com.team1.dadoc.users.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
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
		int randNum = random.nextInt(3) + 1;
		
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
	public void loginProcess(UsersDto dto, HttpSession session) {
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
		}
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

	
}
