package aism.data.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aism.data.dao.AISM_Compose_DAOInter;
import aism.data.dto.AISM_ComposeDTO;

@Service
public class AISM_Compose_Service implements AISM_Compose_ServiceInter {

	@Autowired
	private AISM_Compose_DAOInter dao;
	
	//장르 리스트 가져오기
	@Override
	public List<AISM_ComposeDTO> selectGenre() {
		return dao.selectGenre();
	}
	@Override
	public List<AISM_ComposeDTO> selectKeyword() {
		// TODO Auto-generated method stub
		return dao.selectKeyword();
	}
	//처음 장르 클릭시  키워드보이기
	@Override
	public List<AISM_ComposeDTO> genreClickKeyword(String genre) {
		return dao.genreClickKeyword(genre);
	}
	//키워드 클릭시 분위기,빠르기 가져오기
	@Override
	public List<AISM_ComposeDTO> KeywordClickMoodTempo(String keyword) {
		// TODO Auto-generated method stub
		return dao.KeywordClickMoodTempo(keyword);
	}
	//분위기 클릭시 빠르기 키워드가져오기
	@Override
	public List<AISM_ComposeDTO> moodClickKeyword(String genre, String mood) {
		// TODO Auto-generated method stub
		return dao.moodClickKeyword(genre, mood);
	}
	//빠르기 클릭시 빠르기 키워드가져오기
	@Override
	public List<AISM_ComposeDTO> tempoClickKeyword(String genre, String mood, String tempo) {
		// TODO Auto-generated method stub
		return dao.tempoClickKeyword(genre, mood, tempo);
	}
	
	
	//레퍼런스 키 가져오기
	@Override
	public String getReferenceKey(String artist, String title) {
		// TODO Auto-generated method stub
		return dao.getReferenceKey(artist, title);
	}
	
}
