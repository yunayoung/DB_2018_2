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
<title> JoinCheck </title>
</head>
<body>
 
    <%
        // JOIN.jsp input 에서 입력한 회원가입에 필요한 값들을 변수에 담아준다
        String his_id     = request.getParameter("JOIN_id");
        String his_pw     = request.getParameter("JOIN_pw");
        String iddup= request.getParameter("JOIN_iddup");
    	//var checkid = document.getElementById("iddup").value;
        String strUserName = "dkelab";
  	  String strPassword = "dkelab522";
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
        try {
        	
        
           
            Statement st = conn.createStatement();
            String sql = "Select * FROM CUSTOMER where Customer_id = '"+his_id+ "'";
            ResultSet rs = st.executeQuery(sql);
            // 회원가입에 성공하였으면 첫 페이지로 보낸다
                  Boolean isID = false;
        	while(rs.next()) {
            // rs.next가 true 라면 = 정보가 있다
           	 isID = true;
        	}
        	if(isID)
        	{
        		%> <script> alert("중복된 아이디가 있습니다");  response.sendRedirect("JOIN.jsp");  ; </script> <%
        	}
        	else
        	{
        		

        		
        	    %> <script> 
        	   // document.getElementById("").value = opener.document.userInfo.JOIN_id.value;
        	    //document.getElementById("JOIN_id").value = opener.document.userInfo.id.value;
        	    //opener.document.getElementById("idDuplication").value ="idCheck";
        	  
        	    alert("중복된 아이디가 없습니다"); history.go(-1); 
        	    </script> <%           
            
        	}
        } catch (Exception e) {       
            out.println("DB 연동 실패");
        }    
    %>



</body>
</html>