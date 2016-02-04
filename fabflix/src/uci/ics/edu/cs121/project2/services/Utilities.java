package uci.ics.edu.cs121.project2.services;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Utilities {

	public Utilities() {
	};

	public static void sortByTitle(List<Movie> list) {
		Collections.sort(list, new Comparator<Movie>() {
			@Override
			public int compare(Movie _movie1, Movie _movie2) {
				return _movie1.getTitle().compareTo(_movie2.getTitle());
			}

		});
	}
	
	// "Note: this comparator imposes orderings that are inconsistent with equals."
	public static void sortByYear(List<Movie> list) {
		Collections.sort(list, new Comparator<Movie>() {
			@Override
			public int compare(Movie _movie1, Movie _movie2) {
				return Integer.valueOf(_movie1.getYear()) - Integer.valueOf(_movie2.getYear());
			}
		});
	}

}
