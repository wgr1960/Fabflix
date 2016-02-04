/* A servlet to display the contents of the MySQL movieDB database */

import java.awt.Choice;
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
public class ResultsPaging extends HttpServlet {
	public String getServletInfo() {
		return "Servlet connects to MySQL database and displays result of a SELECT";
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.setContentType("text/html"); // Response mime type
		PrintWriter out = response.getWriter();

		try {
			String pageNumberN = null;
			String pagingDirection = null;
			pageNumberN = request.getParameter("pages");
			pagingDirection = request.getParameter("pageFlip");
			int currentIndex = Integer.valueOf((String) request.getSession().getAttribute("currentIndex"));
			LinkedList<List<Movie>> pagedMovies = new LinkedList<List<Movie>>();
			List<Movie> moviesTemp = (List<Movie>) request.getSession().getAttribute("movies"); 

			
			//############## IF NEXT/PREV WAS CLICKED #############################################################
			if (pagingDirection != null){
				if( ((String)request.getSession().getAttribute("hasPaged")).equals("no") ){
					request.setAttribute("movies", request.getSession().getAttribute("movies"));
					request.getRequestDispatcher("../movieList.jsp").forward(request, response);
					return;
					}
				if (request.getParameter("pageFlip").equals("next")){
					if (currentIndex < moviesTemp.size() / Integer.valueOf(String.valueOf(request.getSession().getAttribute("defaultN")))){
						currentIndex++;
						request.getSession().setAttribute("currentIndex", String.valueOf(currentIndex));
					}
				}
				if (request.getParameter("pageFlip").equals("prev")){
					if ( 0 <currentIndex){
						currentIndex--;
						request.getSession().setAttribute("currentIndex", String.valueOf(currentIndex));
					}
				}
				request.setAttribute("movies", ((LinkedList<List<Movie>>) request.getSession().getAttribute("linkedListMovies")).get(currentIndex));
				request.getRequestDispatcher("../movieList.jsp").forward(request, response);			
			}

			Vector<Movie> list;
			int count = 0;
			
			//################## IF PAGE NUMBER N WAS CHANGED ######################################################
			if (pageNumberN != null) {
				request.getSession().setAttribute("defaultN", String.valueOf(pageNumberN));
				if (Integer.valueOf(String.valueOf(pageNumberN)) > moviesTemp.size()){
					response.sendRedirect("../movieList.jsp");
					return;
				}
				
				while (count < moviesTemp.size()){
					list  = new Vector<Movie>();
					for (int i = 0; i < Integer.valueOf(pageNumberN); i++) {
						if (count < moviesTemp.size())
							list.add(moviesTemp.get(count++));
						else
							break;
					}
					pagedMovies.add(list);
				}
				request.getSession().setAttribute("hasPaged", "yes");
				request.getSession().setAttribute("linkedListMovies", pagedMovies);
				request.setAttribute("movies", pagedMovies.get(currentIndex));
				request.getRequestDispatcher("../movieList.jsp").forward(request, response);
			}

		} catch (java.lang.Exception ex) {
			System.out.println("There was an error with your search");
			System.out.println(ex.getMessage());
			response.sendRedirect("../search.jsp");
		}
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		doGet(request, response);
	}
}
// Fix current use of getAttribute() vs getParameter()
