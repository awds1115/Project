

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Sales_insert
 */
@WebServlet("/Sales_insert")
public class Sales_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sales_insert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		  response.setContentType("text/html; charset=utf-8");
		  Connection conn=null;
		  PreparedStatement pstmt=null;
		  
		  String url="jdbc:oracle:thin:@localhost:1521:orcl";
		  String userid="ora_user";
		  String passcode="human123";
		  
		  String sql="insert into cafe_sales values(seq_sales.nextval,?,?,?,?,sysdate)";
		  String result_flag="";
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn=DriverManager.getConnection(url,userid,passcode); 
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1,request.getParameter("mobile"));
				pstmt.setInt(2,Integer.parseInt(request.getParameter("menu_code")));
				pstmt.setInt(3,Integer.parseInt(request.getParameter("qty")));
				pstmt.setInt(4,Integer.parseInt(request.getParameter("total")));
				
				pstmt.executeUpdate();
				result_flag="OK";
			} catch (Exception e) {
				result_flag="FAIL";
				e.printStackTrace();
			} finally {
					try {
						if(pstmt!=null)pstmt.close();
						if(conn!=null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
			}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
