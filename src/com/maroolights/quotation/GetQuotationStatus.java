package com.maroolights.quotation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.maroolights.data.MySqlConnect;

@WebServlet("/GetQuotationStatus")
public class GetQuotationStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	JSONArray jArray = new JSONArray();
	Connection conn = null;
	PreparedStatement stmt = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
	    PrintWriter out=response.getWriter();
	    /*
	    HttpSession session = request.getSession();
	    
		if(session.getAttribute("userName") == null || session.getAttribute("userId") == null )
		{
				response.sendRedirect("index.jsp");
		}
	    */
	    String sql = "SELECT * FROM maroo_data.d_quotation_details where rowId="+request.getParameter("qid")+";";
	    
	    conn= MySqlConnect.DBConnection();
		
		while (jArray.length()>0) {
			jArray.remove(0);
		}
		
		try
		{
			stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
		
			while (rs.next()) {
				 JSONObject arrayObj = new JSONObject();
				 
				 arrayObj.put("rowId", rs.getString("rowId")==null?"":rs.getString("rowId"));
				 arrayObj.put("projectId", rs.getString("projectId")==null?"":rs.getString("projectId"));
				 arrayObj.put("status", rs.getString("status")==null?"":rs.getString("status"));
				 arrayObj.put("revisedFrom", rs.getString("revisedFrom")==null?"":rs.getString("revisedFrom"));

				 jArray.put(arrayObj);
			}
			JSONObject jsonFinal = new JSONObject();
			jsonFinal.putOnce("data", jArray);
			out.print(jsonFinal);
			conn.close();
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
