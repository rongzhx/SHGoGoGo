package myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Activity;
import entity.Hanyu;
import entity.Joiner;
import entity.MSo;
import entity.Student;
import entity.StudentList;

@WebServlet("/MSoServlet")
public class MSoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	/**
	 * Constructor of the object.
	 */
	public MSoServlet() {
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

	protected int comp2(String a, String b) {
		String[] as = a.split("[-]");
		String[] bs = b.split("[-]");
		for(int i = 0;i < 3;i++) {
			if(Integer.parseInt(as[i]) > Integer.parseInt(bs[i])) return -1;
			else if(Integer.parseInt(as[i]) < Integer.parseInt(bs[i])) return 1;
		}
		return 0;
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
		
		String name = request.getParameter("activity_name");
		String sort_type = request.getParameter("sort_type");
		
		StudentList sl = new StudentList();
		Student student = new Student();
		sl.setActivity_name(name);
		List<Joiner> js = new ArrayList<Joiner>();
		List<MSo> msos = new ArrayList<MSo>();
		MSo mso = new MSo();
		
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
						    mso.setStudent(student);
						    mso.setJoin_time(jtemp.getJoin_time());
						    MSo tempm = new MSo(mso);
						    System.out.print(" " + tempm.getStudent().getStudent_nickname());
						    msos.add(tempm);
						}
					}
				}

				System.out.println("\n" + "*************");
				for(MSo m: msos) System.out.println(m.getStudent().getStudent_nickname());
				
				// sort by join time
				if(sort_type.compareTo("join_time") == 0) {
					Collections.sort(msos, new Comparator<MSo>() {
			            public int compare(MSo arg0, MSo arg1) {
			            	String arg0_name = arg0.getJoin_time();
			            	String arg1_name = arg1.getJoin_time();
			            	System.out.println(arg0_name + "+" + arg1_name);
			                return comp2(arg0_name, arg1_name);
			            }
			        });
				}
				
				// sort by student name
				if(sort_type.compareTo("student_name") == 0) {
					Collections.sort(msos, new Comparator<MSo>() {
			            public int compare(MSo arg0, MSo arg1) {
			            	Hanyu hanyu = new Hanyu();
			            	String arg0_name = hanyu.getStringPinYin(arg0.getStudent().getStudent_nickname());
			            	String arg1_name = hanyu.getStringPinYin(arg1.getStudent().getStudent_nickname());
			            	System.out.println(arg0_name + "+" + arg1_name);
			            	return arg0_name.compareTo(arg1_name);
			            }
			        });
				}
				
				// sort by student id
				if(sort_type.compareTo("student_id") == 0) {
					Collections.sort(msos, new Comparator<MSo>() {
			            public int compare(MSo arg0, MSo arg1) {
			            	String arg0_name = arg0.getStudent().getStudent_id();
			            	String arg1_name = arg1.getStudent().getStudent_id();
			            	System.out.println(arg0_name + "+" + arg1_name);
			            	return arg0_name.compareTo(arg1_name);
			            }
			        });
				}
				
				// sort by student phone
				if(sort_type.compareTo("student_phone") == 0) {
					Collections.sort(msos, new Comparator<MSo>() {
			            public int compare(MSo arg0, MSo arg1) {
			            	String arg0_name = arg0.getStudent().getStudent_phone();
			            	String arg1_name = arg1.getStudent().getStudent_phone();
			            	System.out.println(arg0_name + "+" + arg1_name);
			            	return arg0_name.compareTo(arg1_name);
			            }
			        });
				}
				
				// sort by university
				if(sort_type.compareTo("university") == 0) {
					Collections.sort(msos, new Comparator<MSo>() {
			            public int compare(MSo arg0, MSo arg1) {
			            	Hanyu hanyu = new Hanyu();
			            	String arg0_name = hanyu.getStringPinYin(arg0.getStudent().getStudent_university());
			            	String arg1_name = hanyu.getStringPinYin(arg1.getStudent().getStudent_university());
			            	System.out.println(arg0_name + "+" + arg1_name);
			            	return arg0_name.compareTo(arg1_name);
			            }
			        });
				}
				
				// sort by major
				if(sort_type.compareTo("major") == 0) {
					Collections.sort(msos, new Comparator<MSo>() {
			            public int compare(MSo arg0, MSo arg1) {
			            	Hanyu hanyu = new Hanyu();
			            	String arg0_name = hanyu.getStringPinYin(arg0.getStudent().getStudent_college());
			            	String arg1_name = hanyu.getStringPinYin(arg1.getStudent().getStudent_college());
			            	System.out.println(arg0_name + "+" + arg1_name);
			            	return arg0_name.compareTo(arg1_name);
			            }
			        });
				}
				
				// sort by sex
				if(sort_type.compareTo("sex") == 0) {
					Collections.sort(msos, new Comparator<MSo>() {
			            public int compare(MSo arg0, MSo arg1) {
			            	Hanyu hanyu = new Hanyu();
			            	String arg0_name = hanyu.getStringPinYin(arg0.getStudent().getStudent_sex());
			            	String arg1_name = hanyu.getStringPinYin(arg1.getStudent().getStudent_sex());
			            	System.out.println(arg0_name + "+" + arg1_name);
			            	return arg0_name.compareTo(arg1_name);
			            }
			        });
				}
				
				for(MSo i: msos) {
					sl.addStudents(i.getStudent());
					sl.addJoin_time(i.getJoin_time());
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
