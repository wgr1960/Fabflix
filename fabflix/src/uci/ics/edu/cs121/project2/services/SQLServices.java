package uci.ics.edu.cs121.project2.services;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class SQLServices {
	private Connection conn = null;
	private static Statement stmt = null;
	private ResultSet rs = null;

	//THIS METHOD EXECUTES THE GENERAL SEARCH: ADD PATTERN MATCHING HERE
	//###################### GET MOVIES BY ALL PARAMETERS ###################################################
	public static List<Movie> getMovies(String[] params, Connection conn) {
		ResultSet rs = null;
		List<Movie> movies = null;
		try {
			String andQuery_ = "SELECT * FROM movies where id IN (SELECT movie_id FROM stars, stars_in_movies WHERE star_id = id AND first_name =? AND last_name =?) AND title LIKE ? AND year LIKE ? AND director LIKE ?;";
			String orQuery_ = "SELECT * FROM movies where id IN (SELECT movie_id FROM stars, stars_in_movies WHERE star_id = id AND first_name =? "
					+ "                                      UNION SELECT movie_id FROM stars, stars_in_movies WHERE star_id = id AND last_name =? )"
					+ "									   UNION SELECT * FROM movies where title LIKE ? "
					+ "									   UNION SELECT * FROM movies where year LIKE ? "
					+ "								       UNION SELECT * FROM movies where director LIKE ?;";
			PreparedStatement prepStmt = conn.prepareStatement(andQuery_);
			PreparedStatement prepStmt2 = conn.prepareStatement(orQuery_);

			System.out.println(params.length);
			int count = 1;
			int flag = 1;
			for (String p : params) {
				if (p.equals("")){
					flag = 0;
					prepStmt.setString(count, p);
					prepStmt2.setString(count, p);
				}
				else if (count == 1 || count == 2){
					prepStmt.setString(count, p);
					prepStmt2.setString(count, p);
				}
				else{
					prepStmt.setString(count, '%' + p + '%');
					prepStmt2.setString(count, '%' + p + '%');
				}
				count++;
			}

			System.out.println("DISPLAYING results below: ");
			rs = (flag == 1) ? prepStmt.executeQuery() : prepStmt2.executeQuery(); // displayResultSet(rs);
			movies = _getMovies(rs);

			if (!movies.isEmpty()) {
				for(Movie m: movies){
					_searchGenre(m, conn);
					_searchActor(m, conn);
				}


			} else
				return movies;

			prepStmt.close();
			prepStmt2.close();
			return movies;

		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return movies;
	}

	//NOTE: Handle sorting by first <a href=""> linking to a sorting Servlet, then redirect to movieList.jsp
	//##################### GET MOVIES BY TITLE ###########################################################
	public static List<Movie> getMoviesByTitle(String movieTitle, Connection conn) throws SQLException{
		List<Movie> movies = null;
		String query = "select * from movies where title LIKE \"" + movieTitle + "%\";";
		System.out.println(query);
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		movies = _getMovies(rs);
		if (!movies.isEmpty()) { // Modify movies to include genre, and actors
			for (Movie m : movies) {
				_searchGenre(m, conn);
				_searchActor(m, conn);
			}
		}
		System.out.println("IN getMoviesByTitle");
		for(Movie m: movies){
			System.out.println(m.toString());
		}
		System.out.println(movies.toString());
		return movies;
	}
	
	public static List<Movie> getMoviesbyGenre(String[] param, Connection conn){
		ResultSet rs = null;
		List<Movie> movies = null;
		try {
			String query1 = "SELECT * FROM movies where id IN (SELECT movie_id FROM genres_in_movies, genres WHERE genre_id = id AND name = ?);";
			PreparedStatement prepStmt = conn.prepareStatement(query1);
			System.out.println(param[0]);
			prepStmt.setString(1, param[0]);
			rs = prepStmt.executeQuery();
			System.out.println(rs);
			movies = _getMovies(rs);
			System.out.println(movies.toString());
			if (!movies.isEmpty()) {
				for(Movie m: movies){
					_searchGenre(m, conn);
					_searchActor(m, conn);
				}


			} else
				return movies;

			prepStmt.close();
			return movies;
		}catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return movies;
	}
	
	//#################### GET STAR BY NAME, SHOULD RETURN: List<Star> #################
	public static Star getStar(String[] starFullName, Connection dbcon) throws SQLException {
		Star star = null;
		String query = "Select * from stars where first_name = ? and last_name = ?";
		PreparedStatement prepStmt = dbcon.prepareStatement(query);
		prepStmt.setString(1, starFullName[0]);
		prepStmt.setString(2, starFullName[1]);
		ResultSet rs = prepStmt.executeQuery();
		ResultSetMetaData rsmd = null;
		
		try{
			rsmd = rs.getMetaData();
			int cols = rsmd.getColumnCount();
			String[] params = new String[cols];
			rs.next();
			for(int i = 1; i < cols+1; i++){
				params[i-1] = rs.getString(i);
			}
			star = new Star(params);	
			_modifyActorAddMovies(star, dbcon);
		} catch(SQLException e){
			e.printStackTrace();
		}
		System.out.println(star.toString());
		return star;
	}
	public void insertStar(String[] star) {
		String query;
		String first;
		String last;
		try {
			stmt = conn.createStatement();
			if (star.length > 1) {
				first = star[0];
				last = star[1];
			} else {
				first = "";
				last = star[0];
			}

			query = "INSERT INTO stars VALUES(null, \"" + first + "\", \"" + last
					+ "\", null, null);";
			System.out.println("The query: " + query);
			stmt.executeUpdate(query);

		} catch (SQLException e) {
			System.out.println("Could not insert values into stars");
		}
	}

	public void deleteCustomer(String[] customer) {
		String query;
		try {
			stmt = conn.createStatement();
			query = "DELETE FROM customers where id = " + customer[0] + ";";
			System.out.println(query);
			stmt.executeUpdate(query);
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public static int insertCustomer(final String[] c, final Connection conn) throws SQLException {
		String query, query1;
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			query1 = "INSERT INTO creditcards VALUES(\"" + c[2] + "\", \"" + c[0] + "\", \"" + c[1]
					+ "\", \"" + c[3] + "\");";
			query = "INSERT INTO customers VALUES(null, \"" + c[0] + "\", \"" + c[1] + "\", \""
					+ c[2] + "\", \"" + c[4] + "\", \"" + c[5] + "\",\"" + c[6] + "\");";

			// FIX: IF credit card insert == 0, then don't insert new customer
			stmt.executeUpdate(query1);
			return stmt.executeUpdate(query);

		} catch (SQLException e) {
			System.out.println(e);
			throw e;
		} finally {
			stmt.close();
		}
	}

	//################## DISPLAY METADATA #################################################
	public void displayMetaData() {
		Vector<String> tableNames = new Vector<String>();
		try {
			String catalog = null;
			String dbPattern = null;
			String tnPattern = null;
			String cnPattern = null;
			String[] types = null;

			DatabaseMetaData dbMD = conn.getMetaData();
			System.out.println("Tables in Database: ");
			rs = dbMD.getTables(catalog, dbPattern, tnPattern, types);
			while (rs.next()) {
				System.out.println(rs.getString("TABLE_NAME"));
				tableNames.add(rs.getString("TABLE_NAME"));
			}

			stmt = conn.createStatement();
			for (String table : tableNames) {
				String q = "SELECT * FROM " + table + ";";
				rs = stmt.executeQuery(q);
				ResultSetMetaData myRS = rs.getMetaData();
				System.out.println("----------" + table + "-----------");
				for (int i = 1; i < myRS.getColumnCount() + 1; i++) {
					System.out.print(myRS.getColumnName(i));
					System.out.print("   ");
					System.out.println(myRS.getColumnTypeName(i));
				}
				System.out.println();
			}

		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	//################## NOT BEING USED ###############################################
	public void executeGenericQuery(String q) {
		try {
			stmt = conn.createStatement();
			if (q.contains("select") || q.contains("SELECT")) {
				System.out.println("select query");
				rs = stmt.executeQuery(q);
				displayResultSet(rs);
			} else {
				System.out.println("update/insert/delete query");
				int updated = stmt.executeUpdate(q);
				System.out.println(updated + " row(s) were affected. ");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	//################### FOR DEBUGGING ###############################################
	private static void displayResultSet(ResultSet rs) {
		ResultSetMetaData rsmd;
		try {
			rsmd = rs.getMetaData();
			int cols = rsmd.getColumnCount();
			while (rs.next()) {
				for (int i = 1; i < cols + 1; i++)
					System.out.print(rs.getString(i) + "   ");
				System.out.println();
			}
		} catch (SQLException e) {
			System.out.println(e);
		}

	}
	
	//############# NON-API CALLS ###################################################################
	private static List<Movie> _getMovies(final ResultSet rs) {
		List<Movie> movies = new ArrayList<Movie>();
		ResultSetMetaData rsmd = null;
		try {
			rsmd = rs.getMetaData();
			int cols = rsmd.getColumnCount();
			String[] params = new String[cols];

			while (rs.next()) {
				for (int i = 1; i < cols + 1; i++) {
					params[i - 1] = rs.getString(i);
				}
				movies.add(new Movie(params));
			}
			// return movies;

		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return movies;
	}
	
	private static void _modifyActorAddMovies(Star star, Connection conn) throws SQLException{
		String query = "select movies.title from movies where movies.id IN ( select movie_id from stars_in_movies, stars where first_name = ? and last_name = ? and id = star_id);";
		PreparedStatement prepStmt = conn.prepareStatement(query);
		prepStmt.setString(1, star.getFirst_name());
		prepStmt.setString(2, star.getLast_name());
		ResultSet rs = prepStmt.executeQuery();
		while(rs.next()){
			star.moviesStarredIn.add(rs.getString(1));
		}
		if (rs != null)
			rs.close();
		if (prepStmt != null)
			prepStmt.close();	
	}

	private static void _searchActor(Movie m, Connection conn) throws SQLException {
		String query = "select genres.name from genres where id in (select genre_id from genres_in_movies where movie_id = ?);";
		PreparedStatement pS = conn.prepareStatement(query);
		pS.setString(1, m.getId());
		ResultSet rS = pS.executeQuery();

		while (rS.next()) {
			m.genre.add(rS.getString(1));
		}
		if (rS != null)
			rS.close();
		if (pS != null)
			pS.close();
	}

	private static void _searchGenre(Movie m, Connection conn) throws SQLException {
		String query = "Select first_name, last_name from stars, (select * from movies, stars_in_movies where movie_id = ? "
				+ "and movies.id = movie_id) as temp where stars.id = temp.star_id;";
		PreparedStatement pS = conn.prepareStatement(query);
		pS.setString(1, m.getId());
		ResultSet rS = pS.executeQuery();

		while (rS.next()) {
			m.actor.add(rS.getString(1) + " " + rS.getString(2));
		}
		if (rS != null)
			rS.close();
		if (pS != null)
			pS.close();
	}
}
