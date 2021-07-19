package aism.data.dao;

import java.util.List;

import aism.data.dto.AISM_ComposeDTO;

public interface AISM_Compose_DAOInter {

	//장르 리스트 가져오기
	public List<AISM_ComposeDTO> selectGenre();
	//키워드 리스트 가져오기
	public List<AISM_ComposeDTO> selectKeyword();
	//처음 장르 클릭시  키워드보이기
	public List<AISM_ComposeDTO> genreClickKeyword(String genre);
	//키워드 클릭시 분위기,빠르기 가져오기
	public List<AISM_ComposeDTO> KeywordClickMoodTempo(String keyword);
	//분위기 클릭시 빠르기 키워드가져오기
	public List<AISM_ComposeDTO> moodClickKeyword(String genre,String mood);
	//빠르기 클릭시 빠르기 키워드가져오기 
	public List<AISM_ComposeDTO> tempoClickKeyword(String genre,String mood,String tempo);
	
	
	//레퍼런스 키 가져오기
	public String getReferenceKey(String artist,String title);
}
