package myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Joiner;
import entity.Student;
import entity.StudentList;

@WebServlet("/TotalServlet")
public class TotalServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	/**
	 * Constructor of the object.
	 */
	public TotalServlet() {
		super();
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		StudentList sl = new StudentList();
		Student student = new Student();
		String name = request.getParameter("activity_name");
		sl.setActivity_name(name);
		List<Joiner> js = new ArrayList<Joiner>();
		
		try
		{
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://127.0.0.1:3306/scutcs";
			String user = "root";
			String password = "";
			try {
				Class.forName(driver);
				Connection conn = DriverManager.getConnection(url, user, password);
				if(!conn.isClosed()) 
		             System.out.println("Succeeded connecting to the Database!");
				System.out.println(name);
				Statement statement = conn.createStatement();
				String sql = "select * from activity";
				ResultSet rs = statement.executeQuery(sql);
				while(rs.next()) {
					String sn = rs.getString("name");
					if(sn.compareTo(name) == 0) {
						if(rs.getInt("number") == 0) continue;
						String sj = rs.getString("joiner");
						String[] ps = sj.split("\\|");
						for(String i:ps) {
							String[] sd = i.split("[+]");
							Joiner jj = new Joiner();
							jj.setJoin_students(sd[0]);
							jj.setJoin_time(sd[1]);
							js.add(jj);
						}
					}
				}
				
				for(Joiner jtemp:js) System.out.println(jtemp.getJoin_students());
				
				for(Joiner jtemp:js) {
					String sql1 = "select * from studenttable";
					ResultSet rs1 = statement.executeQuery(sql1);
					while(rs1.next()) {
						String ssn = rs1.getString("username");
						if(ssn.compareTo(jtemp.getJoin_students()) == 0) {
							student.setStudent_nickname(ssn);
							student.setStudent_name(rs1.getString("realname"));
							student.setStudent_university(rs1.getString("university"));
							student.setStudent_college(rs1.getString("major"));
							student.setStudent_id(rs1.getString("id"));
							student.setStudent_phone(rs1.getString("phone"));
							student.setStudent_sex(rs1.getString("sex"));
							String[] temp = (rs1.getString("joinactivities")).split("[+]");
							List<String> ac = new ArrayList<String>();
							for(String ii : temp) ac.add(ii);
						    student.setJoin_activities(ac);
						    sl.addStudents(student);
							sl.addJoin_time(jtemp.getJoin_time());
						}
					}
				}

				request.getSession().setAttribute("ListStudents", sl);
				request.getRequestDispatcher("Total.jsp").forward(request, response);
			} catch(ClassNotFoundException e) {
				System.out.println("Sorry,can`t find the Driver!"); 
				e.printStackTrace();
			} catch(SQLException e) {
				e.printStackTrace();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
}
