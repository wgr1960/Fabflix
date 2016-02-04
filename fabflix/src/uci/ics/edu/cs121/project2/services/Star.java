package uci.ics.edu.cs121.project2.services;
import java.util.List;
import java.util.Vector;


public class Star {

	private String id;
	private String first_name;
	private String last_name;
	private String dob;
	private String photo_url;
	public List<String> moviesStarredIn;
	
	public Star(String id, String first_name, String last_name, String dob,
			String photo_url) {
		super();
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.dob = dob;
		this.photo_url = photo_url;
		this.moviesStarredIn = new Vector<String>();
	}

	public Star(String[] params) {
		this.id = params[0];
		this.first_name = params[1];
		this.last_name = params[2];
		this.dob = params[3];
		this.photo_url = params[4];
		this.moviesStarredIn = new Vector<String>();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPhoto_url() {
		return photo_url;
	}

	public void setPhoto_url(String photo_url) {
		this.photo_url = photo_url;
	}

	public List<String> getMoviesStarredIn() {
		return moviesStarredIn;
	}

	public void setMoviesStarredIn(List<String> moviesStarredIn) {
		this.moviesStarredIn = moviesStarredIn;
	}

	@Override
	public String toString() {
		return "Star [id=" + id + ", first_name=" + first_name + ", last_name="
				+ last_name + ", dob=" + dob + ", photo_url=" + photo_url
				+ ", moviesStarredIn=" + moviesStarredIn + "]";
	}

}
