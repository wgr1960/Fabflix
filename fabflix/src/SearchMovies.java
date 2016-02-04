import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import java.util.Map.Entry;

import javax.servlet.*;
import javax.servlet.http.*;

import javax.jws.WebService;
import javax.naming.InitialContext;
import javax.naming.Context;
import javax.sql.DataSource;

import uci.ics.edu.cs121.project2.services.Movie;
import uci.ics.edu.cs121.project2.services.SQLServices;

public class SearchMovies extends HttpServlet {
	public String getServletInfo() {
		return "Servlet connects to MySQL database and searches database for movies";
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,
			ServletException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		ResultSet rs = null;
		try {
			// SET UP Context environment, to look for Data Pooling Resource
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/TestDB");
			Connection dbcon = ds.getConnection();

			//########### SEARCH INPUT PARAMETERS, EXECUTE search #####################################################
			Vector<String> params = new Vector<String>();
			params.add(request.getParameter("fname"));
			params.add(request.getParameter("lname"));
			params.add(request.getParameter("title"));
			params.add(request.getParameter("year"));
			params.add(request.getParameter("director"));

			List<Movie> movies = new ArrayList<Movie>();
			movies = SQLServices.getMovies(params.toArray(new String[params.size()]), dbcon);

			
			//########## SET DEFAULT SESSION() PARAMETERS ####################################
			request.getSession().removeAttribute("movies");
			request.getSession().removeAttribute("linkedListMovies");
			request.getSession().removeAttribute("hasPaged");
			request.getSession().setAttribute("hasPaged", "no");
			request.getSession().setAttribute("movies", movies);
			request.getSession().setAttribute("currentIndex", "0");
			request.getSession().setAttribute("defaultN", "5");

		    //########## IF MOVIES FROM SEARCH NON-EMPTY ###########################################
			List<String> fields = Movie.fieldNames();
			int count = 1;
			if (!movies.isEmpty()) {
				request.setAttribute("movies", movies);
				for (String field : fields) {
					request.setAttribute("f" + count++, field);
				}
				request.getRequestDispatcher("../movieList.jsp").forward(request, response);
			} else {
				out.println("<html><head><title>error</title></head>");
				out.println("<body><h1>could not find any movies, try your search again.</h1>");
				out.println("<p> we are terribly sorry, please go back. </p>");
				out.println("<table border>");
				out.println("</table>");
			}
			dbcon.close();

		} catch (SQLException ex) {
			while (ex != null) {
				System.out.println("SQL Exception:  " + ex.getMessage());
				ex = ex.getNextException();
			}
		}

		catch (java.lang.Exception ex) {
			out.println("<html>" + "<head><title>" + "moviedb: error" + "</title></head>\n<body>"
					+ "<p>SQL error in doGet: " + ex.getMessage() + "</p></body></html>");
			return;
		}
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
	}

}
