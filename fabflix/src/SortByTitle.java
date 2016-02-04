/* A servlet to display the contents of the MySQL movieDB database */

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.jws.WebService;

import javax.naming.InitialContext;
import javax.naming.Context;
import javax.sql.DataSource;

import uci.ics.edu.cs121.project2.services.Movie;
import uci.ics.edu.cs121.project2.services.Utilities;

//@WebServlet
public class SortByTitle extends HttpServlet {
	public String getServletInfo() {
		return "Servlet connects to MySQL database and displays result of a SELECT";
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.setContentType("text/html"); // Response mime type
		PrintWriter out = response.getWriter();

		try {
			List<Movie> movies = (List<Movie>) request.getSession().getAttribute("movies");
			if (movies.isEmpty()) {
				response.sendRedirect("../search.jsp");
			}
			else{
				Utilities.sortByTitle(movies);
				request.getRequestDispatcher("../movieList.jsp").forward(request, response);
			}
		}
		catch (java.lang.Exception ex) {
			System.out.println("There was an error with your search");
			response.sendRedirect("../search.jsp");
		}
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
	}
}
