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

public class BrowseTitle extends HttpServlet {
	public String getServletInfo() {
		return "Servlet connects to MySQL database and searches database for movies";
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		ResultSet rs = null;
		try {
			// SET UP Context environment, to look for Data Pooling Resource
			Context initCtx = new InitialContext();
			if (initCtx == null)
				out.println("initCtx is NULL");
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			if (envCtx == null)
				out.println("envCtx is NULL");

			DataSource ds = (DataSource) envCtx.lookup("jdbc/TestDB");
			if (ds == null)
				out.println("ds is null.");
			Connection dbcon = ds.getConnection();
			if (dbcon == null)
				out.println("dbcon is null.");

			// GET ALL parameters from response, and call a SQL Service

			String params = request.getParameter("title");

			System.out.println("About to make a call to Browse Title: ");
			List<Movie> movies = new ArrayList<Movie>();
			movies = SQLServices.getMoviesByTitle(params, dbcon); 
						
			List<String> fields = Movie.fieldNames();	
			int count = 1;
			
			if (!movies.isEmpty()) {
				request.setAttribute("movies", movies);
				for(String field: fields){
					request.setAttribute("f" + count, field);
					count++;
				}
				request.getRequestDispatcher("../movieList.jsp").forward(request, response);
				//response.sendRedirect("../movieList.jsp");
			} else {
				out.println("<HTML><HEAD><TITLE>Error</TITLE></HEAD>");
				out.println("<BODY><H1>Could not find any movies, try your search again.</H1>");
				out.println("<p> We are terribly sorry, please go back. </p>");
				out.println("<TABLE border>");
				out.println("</TABLE>");
			}
			dbcon.close();

		} catch (SQLException ex) {
			while (ex != null) {
				System.out.println("SQL Exception:  " + ex.getMessage());
				ex = ex.getNextException();
			}
		}

		catch (java.lang.Exception ex) {
			out.println("<html>" + "<head><title>" + "moviedb: error"
					+ "</title></head>\n<body>" + "<p>SQL error in doGet: "
					+ ex.getMessage() + "</p></body></html>");
			return;
		}
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
	}
	

}
