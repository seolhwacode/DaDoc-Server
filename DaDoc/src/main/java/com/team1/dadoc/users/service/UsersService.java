package com.team1.dadoc.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team1.dadoc.users.dto.UsersDto;

public interface UsersService {
	//inputId 와 같은 id 가 DB 에 존재하는지 여부 Map 으로 return
	public Map<String, Object> isIdExist(String inputId);
	//inputNick 과 같은 nickname 이 DB 에 존재하는지 여부 Map 으로 return
	public Map<String, Object> isNickExist(String inputNick);
	//UsersDto 의 내용을 db 에 추가 - 비밀번호 암호화 추가
	public boolean addUser(UsersDto dto);
	//dto 의 id/pwd 의 값이 db 에 일치하는 값이 있는지 확인 및 로그인(session)
	public void loginProcess(UsersDto dto, HttpSession session);
	//inputId 에 해당하는 data 를 읽어와서 해당 질문과 inputId를 mView 에 넣어준다.
	public void getPwdQuestion(ModelAndView mView, String inputId);
	//비밀번호 찾기 - id 와 작성 답변을 통해 질문의 답이 맞는지 체크한다.
	public boolean checkAnswer(String id, String answer);
	//새로운 비밀번호를 생성하고, db 에 pwd 를 갱신한 후, 새로 생성한 pwd plain text 를 mView 에 담기
	public void createNewRPwd(ModelAndView mView, String id);
	//id 에 해당하는 pwd 를 제외한 정보를 모두 읽어와, UsersDto 로 return
	public UsersDto getUserDataAll(String id);
	//id 에 해당하는 질문을 읽어와서 리턴
	public Map<String, Object> getQuestion(String id);
	//프로필 사진을 바꿀 때, upload 폴더에 upload 하기 - imagePath(/upload/실제파일이름) 리턴
	public Map<String, Object> uploadProfile(MultipartFile image, HttpServletRequest request);
	//imagePath 에 해당하는 파일을 삭제한다.
	public boolean deleteUploadProfile(String imagePath, HttpServletRequest request);
	//프로필(profile)을 db 에 수정 반영한다.
	public void updateProfile(UsersDto dto);
	//id 와, 입력한 비밀번호가 맞는지 확인 여부 return
	public boolean pwdCheck(UsersDto dto);
	//사용자 정보 update
	public void update(UsersDto dto);
	//비밀번호 update
	public boolean pwdUpdate(UsersDto dto, HttpSession session);
	//회원 탈퇴하기 : id 에 해당하는 사용자 정보 삭제 -> 사용자 id 삭제 된 것을 확인 -> 결과 boolean 값으로 리턴
	public boolean leave(HttpSession session);
}
