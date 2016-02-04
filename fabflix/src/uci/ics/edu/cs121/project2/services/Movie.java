package uci.ics.edu.cs121.project2.services;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;

public class Movie implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2703013535675282264L;
	private String id;
	private String title;
	private String year;
	private String director;
	private String banner_url;
	private String trailer_url;
	public Vector<String> genre;     //There can be multiple genres associated with one movie
	public Vector<String> actor;     //There can be multiple actors associated with one actor
	
	public Movie(String id, String title, String year, String director,
			String banner_url, String trailer_url, String genre, String actor) {
		super();
		this.id = id;
		this.title = title;
		this.year = year;
		this.director = director;
		this.banner_url = banner_url;
		this.trailer_url = trailer_url;
		this.genre = new Vector<String>();
		this.actor = new Vector<String>();
	}

	public Movie(String[] params) {
		this.id = params[0];
		this.title = params[1];
		this.year = params[2];
		this.director = params[3];
		this.banner_url = params[4];
		this.trailer_url = params[5];
		this.genre = new Vector<String>();
		this.actor = new Vector<String>();
	}

	@Override
	public String toString() {
		return "Movie [id=" + id + ", title=" + title + ", year=" + year
				+ ", director=" + director + ", banner_url=" + banner_url
				+ ", trailer_url=" + trailer_url + ", genre=" + genre
				+ ", actor=" + actor + "]";
	}

	public static List<String> fieldNames(){
		return Arrays.asList("id", "title", "year", "director", "banner_url", "trailer_url", "genre", "actor");
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getBanner_url() {
		return banner_url;
	}

	public void setBanner_url(String banner_url) {
		this.banner_url = banner_url;
	}

	public String getTrailer_url() {
		return trailer_url;
	}

	public void setTrailer_url(String trailer_url) {
		this.trailer_url = trailer_url;
	}
	
	public List<String> getGenre() {
		return (List<String>)this.genre;
	}

	public void setGenre(String genre) {
		this.genre.add(genre);
	}

	public String getActor() {
		return actor.toString();
	}

	public void setActor(String actor) {
		this.actor.add(actor);
	}

}
