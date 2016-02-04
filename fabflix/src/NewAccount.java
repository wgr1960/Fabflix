/* A servlet to display the contents of the MySQL movieDB database */

import java.io.*;
import java.net.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import java.util.Date;
import java.util.Map.Entry;

import javax.servlet.*;
import javax.servlet.http.*;

import javax.jws.WebService;
import javax.naming.InitialContext;
import javax.naming.Context;
import javax.sql.DataSource;
//import javax.servlet.annotation.*;

import uci.ics.edu.cs121.project2.services.SQLServices;

public class NewAccount extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String getServletInfo() {
		return "Servlet connects to MySQL database and displays result of a SELECT";
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html"); // Response mime type
		PrintWriter out = response.getWriter();

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/TestDB");
			Connection dbcon = ds.getConnection();

			// Get all parameters from response, and call a SQL Service
			Vector<String> params = new Vector<String>();
			params.add(request.getParameter("fname"));
			params.add(request.getParameter("lname"));
			params.add(request.getParameter("cardnum"));
			params.add(request.getParameter("exp"));
			params.add(request.getParameter("address"));
			params.add(request.getParameter("email"));
			params.add(request.getParameter("password"));

			// ############### IF CHECKOUT WAS REQUESTED  ########################################
			if (String.valueOf(request.getParameter("checkout")).equals("true")) {
				String _query = "Select * from creditcards where first_name = ? and last_name = ? and id = ? and expiration= ?;";
				PreparedStatement prepStmt = dbcon.prepareStatement(_query);
				prepStmt.setString(1, params.get(0));
				prepStmt.setString(2, params.get(1));
				prepStmt.setString(3, params.get(2));
				prepStmt.setString(4, params.get(3));
				ResultSet rs = null;
				rs = prepStmt.executeQuery();
				
				//############### IF CREDIT CARD INFORMATION IS VALID ##############################
				if (rs.isBeforeFirst()) {
					request.getSession().removeAttribute("_checkoutErrorMessage");
					HashMap<String, Vector<String>> _cart = (HashMap<String, Vector<String>>) request.getSession().getAttribute("shopping_cart");
					String _insert = "Insert into sales values(null, ?, ?, ?);";
					String _customer = String.valueOf(request.getSession().getAttribute("_customerID"));
					prepStmt = dbcon.prepareStatement(_insert);
					String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
					int _records = 0;
					for (Entry e : _cart.entrySet()) {
						prepStmt.setString(1, _customer); // customer ID
						prepStmt.setString(2, ((Vector<String>) e.getValue()).get(0)); // movie
						prepStmt.setString(3, date); // Sale Date
						_records += prepStmt.executeUpdate();
					}
					request.setAttribute("_recordsUpdated", _records);
					request.getRequestDispatcher("../confirmationPage.jsp").forward(request, response);

				} else {
					request.getSession().setAttribute("_checkoutErrorMessage", "YOUR INFORMATION DOES NOT MATCH OUR RECORDS, TRY AGAIN.");
					response.sendRedirect("/fabflix/Checkout.jsp");
				}
				return;
			}

			//##################### IF NEW USER ACCOUNT WAS REQUESTED ############################################################
			int recordsUpdated = SQLServices.insertCustomer(params.toArray(new String[7]), dbcon);
			if (recordsUpdated != 0) {
				System.out.println(recordsUpdated + " records were updated");
				response.sendRedirect("../userAccount.jsp");
			} else {
				out.println("<html><head><title>  Error  </title></head>");
				out.println("<body><h1> could not add new user account to database, try again.  </h1>");
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
			out.println("<html>" + "<head><title>" + "moviedb: error" + "</title></head>\n<body>" + "<p>sql error in doget: " + ex.getMessage()
					+ "</p></body></html>");
			return;
		}
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doGet(request, response);
	}
}
