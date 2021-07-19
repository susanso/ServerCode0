package aism.data.service;


import java.util.List;

import aism.data.dto.AISM_User_Membership_Info_DTO;
import aism.data.dto.AISM_User_Work_List_DTO;

public interface AISM_User_Membership_Info_ServiceInter {
	//회원가입
	public void insertMember(AISM_User_Membership_Info_DTO dto);
	//아이디와 비번이 맞는지 체크
	public boolean isCheckPass(String id,String pwd);
	//아이디 중복체크
	public int isCheckIdMember(String id);
	//아이디 찾기
	public String findMemberId(String birthyear, String email);
	//비밀번호 찾기
	public int findMemberPwd(String id, String email);
	//비밀번호 분실후 재설정
	public void findMemberUpdatePwd(String id, String email, String updatePwd);
	//회원정보출력
	public AISM_User_Membership_Info_DTO memberInfo(String id);
	//회원정보 수정
	public void updateUserInfo(String id, String email, String job, String addr, String phone, String profile, String username, String nick);
	//프로필 이미지 가져오기
	public String findMemberProfileImg(String id);
	//로그인 로그 저장
	public void loginTime(String id);
	
	
	// 내 작업리스트 보여주기
	public List<AISM_User_Work_List_DTO> myWorkList(String id);
	// 내 작업리스트 입력
	public void insertmyWorkList(AISM_User_Work_List_DTO dto);
	// 내 작업리스트 삭제
	public void deletemyWorkList(String userId, String project);
	//내 작업리스트중 중복된 이름이 있을경우
	public Boolean hasmyWorkList(String userId, String project);
	//작업리스트
	public AISM_User_Work_List_DTO showDetailAlbum(String user, String albumName);
}
