package aism.data.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import aism.data.dto.AISM_ComposeDTO;

@Repository
public class AISM_Compose_DAO extends SqlSessionDaoSupport 
implements AISM_Compose_DAOInter{
	//장르 리스트 가져오기
	@Override
	public List<AISM_ComposeDTO> selectGenre() {
		return getSqlSession().selectList("selectGenre");
	}
	//키워드 리스트 가져오기
	@Override
	public List<AISM_ComposeDTO> selectKeyword() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectKeyword");
	}
	
	//처음 장르 클릭시  키워드보이기
	@Override
	public List<AISM_ComposeDTO> genreClickKeyword(String genre) {
		return getSqlSession().selectList("genreClickKeyword", genre);
	}
	//키워드 클릭시 분위기,빠르기 가져오기
	@Override
	public List<AISM_ComposeDTO> KeywordClickMoodTempo(String keyword) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("KeywordClickMoodTempo", keyword);
	}
	//분위기 클릭시 빠르기 키워드가져오기
	@Override
	public List<AISM_ComposeDTO> moodClickKeyword(String genre, String mood) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("genre", genre);
		map.put("mood", mood);
		return getSqlSession().selectList("moodClickKeyword", map);
	}
	//빠르기 클릭시 빠르기 키워드가져오기
	@Override
	public List<AISM_ComposeDTO> tempoClickKeyword(String genre, String mood, String tempo) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("genre", genre);
		map.put("mood", mood);
		map.put("tempo", tempo);
		return getSqlSession().selectList("tempoClickKeyword", map);
	}
	@Override
	public String getReferenceKey(String artist, String title) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artist", artist);
		map.put("title", title);
		return getSqlSession().selectOne("getReferenceKey", map);
	}
	
}
