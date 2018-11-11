package kh.com.a.model;

import java.io.Serializable;

public class GenreDto implements Serializable {

	private String genre;

	public GenreDto() {
		super();
	}

	public GenreDto(String genre) {
		super();
		this.genre = genre;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "GenreDto [genre=" + genre + "]";
	}
	
	
	
}
