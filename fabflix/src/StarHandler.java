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

import uci.ics.edu.cs121.project2.services.SQLServices;
import uci.ics.edu.cs121.project2.services.Star;

//@WebServlet
public class StarHandler extends HttpServlet {
	public String getServletInfo() {
		return "Servlet connects to MySQL database and displays result of a SELECT";
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.setContentType("text/html"); // Response mime type
		PrintWriter out = response.getWriter();

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/TestDB");
			Connection dbcon = ds.getConnection();

			// ####### SEARCH STAR BY NAME #########################################################################
			System.out.println(request.getParameter("star"));
			String[] starFullName = request.getParameter("star").trim().replaceAll("[^a-zA-Z ./-]", "").split(" ");
			Star star= null;
			star = SQLServices.getStar(starFullName, dbcon);
	
			if (star != null) {
				request.setAttribute("star", star);
				request.getRequestDispatcher("../singleStar.jsp").forward(request, response);
			} else {
				out.println("<html><head><title>unsuccessful search for actor</title></head>");
				request.setAttribute("error", "Could not retrieve actor");
			}
			dbcon.close();

		} catch (SQLException ex) {
			while (ex != null) {
				System.out.println("SQL Exception:  " + ex.getMessage());
				ex = ex.getNextException();
			}
		} catch (java.lang.Exception ex) {
			out.println("<html>" + "<head><title>" + "moviedb: error"
					+ "</title></head>\n<body>" + "<p>sql error in doget: "
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
