package data.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dao.AISM_User_Membership_Info_DAOInter;
import data.dto.AISM_User_Membership_Info_DTO;
import data.dto.AISM_User_Work_List_DTO;

@Service
public class AISM_User_Membership_Info_Service 
	implements AISM_User_Membership_Info_ServiceInter {

	@Autowired
	private AISM_User_Membership_Info_DAOInter dao;
	
	//로그인
	@Override
	public boolean isCheckPass(String id, String pwd) {
		// TODO Auto-generated method stub
		System.out.println(dao.isCheckUser(id, pwd));
		return dao.isCheckUser(id, pwd)== 0 ? false : true;
	}
	//회원가입
	@Override
	public void insertMember(AISM_User_Membership_Info_DTO dto) {
		// TODO Auto-generated method stub
		dao.createMember(dto);	
	}
	//아이디 중복체크
	@Override
	public int isCheckIdMember(String id) {
		// TODO Auto-generated method stub
		System.out.println("서비스 접근 완료"+id);
		return dao.isCheckIdMember(id);
	}
	//아이디 찾기
	@Override
	public String findMemberId(String birthyear, String email) {
		// TODO Auto-generated method stub
		return dao.findMemberId(birthyear, email);
	}
	//비밀번호 찾기
	@Override
	public int findMemberPwd(String id, String email) {
		// TODO Auto-generated method stub
		return dao.findMemberPwd(id, email);
	}
	//비밀번호 분실후 재설정
	@Override
	public void findMemberUpdatePwd(String id, String email, String updatePwd) {
		// TODO Auto-generated method stub
		dao.findMemberUpdatePwd(id, email, updatePwd);
	}
	//회원정보출력
	@Override
	public AISM_User_Membership_Info_DTO memberInfo(String id) {
		// TODO Auto-generated method stub
		return dao.memberInfo(id);
	}
	//회원정보 수정
	@Override
	public void updateUserInfo(String id, String email, String job, String addr, String phone, String profile, String username,String nick) {
		// TODO Auto-generated method stub
		dao.updateUserInfo(id, email, job, addr, phone, profile, username, nick);
	}
	//프로필 이미지 가져오기
	@Override
	public String findMemberProfileImg(String id) {
		// TODO Auto-generated method stub
		return dao.findMemberProfileImg(id);
	}
	//로그인 로그 저장
	@Override
	public void loginTime(String id) {
		// TODO Auto-generated method stub
		dao.loginTime(id);
	}
	//리스트 가져오기
	@Override
	public List<AISM_User_Work_List_DTO> myWorkList(String id) {
		// TODO Auto-generated method stub
		return dao.myWorkList(id);
	}
	//리스트 입력
	@Override
	public void insertmyWorkList(AISM_User_Work_List_DTO dto) {
		// TODO Auto-generated method stub
	   dao.insertmyWorkList(dto);	
	}
	//리스트 삭제
	@Override
	public void deletemyWorkList(String userId, String project) {
		// TODO Auto-generated method stub
		dao.deletemyWorkList(userId, project);
	}
	//내 작업리스트중 중복된 이름이 있을경우
	@Override
	public Boolean hasmyWorkList(String userId, String project) {
		// TODO Auto-generated method stub
		return dao.hasmyWorkList(userId, project) == 0 ? true : false;// 검색해보니 없다 그럼 : ture
	}
	@Override
	public AISM_User_Work_List_DTO showDetailAlbum(String user, String albumName) {
		// TODO Auto-generated method stub
		return dao.showDetailAlbum(user, albumName);
	}
}
