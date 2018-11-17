<%@ page language="java" 
    contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Login_Check </title>
</head>
<body>
 
    <h1> 로그인 체크 페이지 </h1>
    
    <%
     String strUserName = "dkelab";
	  String strPassword = "*5DC0701CE78BDE4AA84ADB2C6C033C138383B496";
	 String strConnectString = "jdbc:mysql://155.230.36.58:3306/test";
	 String DBMS_DRIVER_CLASS_NAME = "com.mysql.cj.jdbc.Driver";
	 Connection conn = null;
		
		try {
			// Load a JDBC driver for Oracle DBMS
			Class.forName(DBMS_DRIVER_CLASS_NAME);
			// Get a Connection object 
			System.out.println("Success!");
		}catch(ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}
		
		      try{

		       conn = DriverManager.getConnection(strConnectString,strUserName, strPassword);
		      }catch (SQLException ex) {
		    	  System.err.println("Cannot get a connection: " + ex.getMessage());
					System.exit(1);
		      }
		      try{
         String user_id= request.getParameter("input_id");
         String user_pw= request.getParameter("input_pw");
        Statement st = conn.createStatement();
        // 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
        String sql = "SELECT * from CUSTOMER where Customer_id = '"+user_id+"'AND Password='"+user_pw+"'";
        ResultSet rs = st.executeQuery(sql);
        System.out.println("Success!");
        // isLogin 은 로그인 확인 유무를 위한 변수
        Boolean isLogin = false;
        while(rs.next()) {
            // rs.next가 true 라면 = 정보가 있다
            isLogin = true;
        }
        
        // DB에 내가 적은 정보가 있다면
        if(isLogin) {
            // 지금 로그인할 id와 pw를 session에 저장하고
            session.setAttribute("id", user_id); 
            session.setAttribute("pw", user_pw);
            if(user_id=="admin")
            {
            	 response.sendRedirect("admin.jsp");    
            	
            }
            // 첫 페이지로 돌려보낸다
            response.sendRedirect("login.jsp");    
        } else {
            // DB에 내가적은 정보가 없다면 경고창을 띄워준다
            %> <script> alert("로그인 실패"); history.go(-1); </script> <%            
        }
        
        
    } catch (SQLException ex1) {
  	  System.err.println("Cannot get a connection: " + ex1.getMessage());
			System.exit(1);
    }	try {
		// Close the Statement object.
		//stmt.close(); 
		// Close the Connection object.
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    %>
 
</body>
</html>
