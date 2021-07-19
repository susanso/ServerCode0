package aism.data.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import aism.data.dto.AISM_User_Membership_Info_DTO;
import aism.data.dto.AISM_User_Work_List_DTO;

@Repository
public class AISM_User_Membership_Info_DAO 
	extends SqlSessionDaoSupport 
		implements AISM_User_Membership_Info_DAOInter {
	//로그인
	@Override
	public int isCheckUser(String id, String pwd) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		//로그인 시간 넣기
		
		return getSqlSession().selectOne("checkPassOfMember2",map);
	}
	//로그인 로그 저장
	@Override
	public void loginTime(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		getSqlSession().insert("loginTime",map);
	}
	//회원가입
	@Override
	public void createMember(AISM_User_Membership_Info_DTO dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfMembers",dto);
	}
	//아이디 중복체크
	@Override
	public int isCheckIdMember(String id) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		System.out.println("dao 접근 완료"+id);
		map.put("userid", id);
		return getSqlSession().selectOne("isCheckIdMember",map);
	}
	//아이디 찾기
	@Override
	public String findMemberId(String birthyear, String email) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("birthyear", birthyear);
		map.put("email", email);
		String userId = getSqlSession().selectOne("findMemberId",map);
		return userId;
	}
	//비밀번호 찾기
	@Override
	public int findMemberPwd(String id, String email) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		return getSqlSession().selectOne("findMemberPwd",map);
	}
	//비밀번호 분실후 재설정
	@Override
	public void findMemberUpdatePwd(String id, String email, String updatePwd) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		map.put("updatepwd", updatePwd);
		getSqlSession().update("findMemberUpdatePwd", map);
	}
	//회원정보출력
	@Override
	public AISM_User_Membership_Info_DTO memberInfo(String id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("memberInfo", id);
	}
	//회원정보수정
	@Override
	public void updateUserInfo(String id, String email, String job, String addr, String phone, String profile, String username,String nick) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("job", job);
		map.put("id", id);
		map.put("addr", addr);
		map.put("profile", profile);
		map.put("phone", phone);
		map.put("username", username);
		map.put("nick", nick);
		getSqlSession().update("updateUserInfo",map);
	}
	//프로필 이미지 가져오기
	@Override
	public String findMemberProfileImg(String id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("findMemberProfileImg",id);
	}
	// 내 작업리스트 보여주기
	@Override
	public List<AISM_User_Work_List_DTO> myWorkList(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("username", id);
		return getSqlSession().selectList("selectWorkList", map);
	}
	// 내 작업리스트 입력
	@Override
	public void insertmyWorkList(AISM_User_Work_List_DTO dto) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user", dto.getUser());
		map.put("subject", dto.getSubject());
		map.put("createdate", dto.getCreatedate());
		map.put("composetype", dto.getComposetype());
		map.put("songinfo1", dto.getSonginfo1());
		map.put("songinfo2", dto.getSonginfo2());
		map.put("albumcover", dto.getAlbumcover());
		getSqlSession().selectList("insertWorkList", map);
	}
	// 내 작업리스트 삭제
	@Override
	public void deletemyWorkList(String userId, String project) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user", userId);
		map.put("project", project);
		getSqlSession().selectList("deletetWorkList", map);
	}
	//내 작업리스트중 중복된 이름이 있을경우
	@Override
	public int hasmyWorkList(String userId, String project) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user", userId);
		map.put("project", project);
		return getSqlSession().selectOne("hasWorkList", map);
	}
	//작업리스트
	@Override
	public AISM_User_Work_List_DTO showDetailAlbum(String user, String albumName) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("albumName", albumName);
		return getSqlSession().selectOne("showDetailAlbum", map);
	}
}
