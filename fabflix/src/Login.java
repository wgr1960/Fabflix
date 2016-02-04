/* A servlet to display the contents of the MySQL movieDB database */

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.InitialContext;
import javax.naming.Context;
import javax.sql.DataSource;

//@WebServlet
public class Login extends HttpServlet {
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
			
			//############## IF ADD NEW CART ITEM #########################################################
			if(String.valueOf(request.getParameter("_addCartItem")).equals("true")){
				String _title = String.valueOf(request.getParameter("_title"));
				Integer _quantity = Integer.valueOf(String.valueOf(request.getParameter("_quantity")));
				HashMap<String, Vector<String>> _cart =  (HashMap<String, Vector<String>>) request.getSession().getAttribute("shopping_cart");
				String[] _metadata = {String.valueOf(request.getParameter("_movieID")), String.valueOf(_quantity)};
				Vector<String> _value = new Vector(Arrays.asList(_metadata));
				
				Vector<String> _status = null;
				if (_cart.containsKey(_title))		
					_status = (_quantity != 0)? _cart.put(_title, _value): _cart.put(_title, _value);
				else
					_cart.put(_title, _value);
				
				request.getSession().removeAttribute("shopping_cart");
				request.getSession().setAttribute("shopping_cart", _cart);	
				response.sendRedirect("/fabflix/servlet/MovieHandler?movie="+_title);
				return;			
			}
			
			//################ IF VIEW SHOPPING CART ###########################################################
			if(String.valueOf(request.getParameter("cart")).equals("true")){
				response.sendRedirect("../userAccount.jsp");
				return;			
			}

			//############## IF LOGOUT ##########################################################################
			if (String.valueOf(request.getParameter("logout")).equals("true")) {
				request.getSession().invalidate();
				return;
			}

			// ############ LOGIN  #############################################################################
			String loginQuery = "Select * from customers where email = ? and password = ?;";
			PreparedStatement prepStmt = dbcon.prepareStatement(loginQuery);
			prepStmt.setString(1, request.getParameter("email"));
			prepStmt.setString(2, request.getParameter("password"));
			ResultSet rset = prepStmt.executeQuery();
			System.out.println(request.getParameter("email"));
			System.out.println(request.getParameter("password"));

			//#####    LOGIN SUCCESSFUL ############
			if (rset.isBeforeFirst()) {
				rset.next();
				String _customerID = rset.getString(1);
				System.out.println("CUSTOMER ID: " + rset.getString(1));
				HashMap<String, Vector<String>> cart = new HashMap<String, Vector<String>>();
				request.getSession().setAttribute("shopping_cart", cart);
				request.getSession().setAttribute("_customerID", _customerID);
				response.sendRedirect("../userAccount.jsp");
			} else {
				String lastname = request.getParameter("email");
				String password = request.getParameter("password");
				System.out.println(lastname + " and " + password);
				out.println("<html><head><title>unsuccessful login</title></head>");
				out.println("<body><h1>could not login</h1>");
				out.println("<table border>");
				out.println("<td> status code goes here </td>");
				out.println("</table>");
			}
			rset.close();
			prepStmt.close();
			dbcon.close();

		} catch (SQLException ex) {
			while (ex != null) {
				System.out.println("SQL Exception:  " + ex.getMessage());
				ex = ex.getNextException();
			} 
		}

		catch (java.lang.Exception ex) {
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
