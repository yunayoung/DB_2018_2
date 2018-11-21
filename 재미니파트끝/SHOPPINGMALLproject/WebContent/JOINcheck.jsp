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
        String address= request.getParameter("JOIN_address");
        String phonenumber= request.getParameter("JOIN_phonenumber");
        String sex= request.getParameter("JOIN_sex");
        String age= request.getParameter("JOIN_age");
        String job= request.getParameter("JOIN_job");
        String type= request.getParameter("JOIN_type");
        String name= request.getParameter("JOIN_name");
  
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
  		     System.out.println(sex);
  		      }catch (SQLException ex) {
  		    	  System.err.println("Cannot get a connection: " + ex.getMessage());
  					System.exit(1);
  		      }
        try {
         	if(sex==null||sex=="")
        	{
        		sex="NULL";
        	}
         	else
         	{
         		sex="'"+sex+"'";
         	}
         	if(age==null||age=="")
        	{
        		age="NULL";
        	}
         	else
         	{
         		age="'"+age+"'";
         	}
        	if(job==null||job=="")
         	{
         		job="NULL";
         	}
        	else
         	{
         		job="'"+job+"'";
         	}
         	if(type==null||type=="")
         	{
         		type="NULL";
         	}
         	else
         	{
         		type="'"+type+"'";
         	}
        	if(name==null||name=="")
        	{
         		name="NULL";
         	}
        	else
         	{
         		name="'"+name+"'";
         	}
        	System.out.println(sex);
           Statement st = conn.createStatement();
            String sql = "INSERT INTO CUSTOMER VALUES ('" + his_id + 
                    "','" + his_pw + 
                    "','" + address+
                     "','" + phonenumber+ 
                      "'," + sex+ 
                          "," + age+ 
                       "," + job+ 
                        "," + type+ 
                         "," + name+ 
                    ")";
            st.executeUpdate(sql);
       
            // 회원가입에 성공하였으면 첫 페이지로 보낸다
               
        	   // document.getElementById("").value = opener.document.userInfo.JOIN_id.value;
        	    //document.getElementById("JOIN_id").value = opener.document.userInfo.id.value;
        	    //opener.document.getElementById("idDuplication").value ="idCheck";
        	    int number=3;
        	    if(address=="DAEGU"||address=="Daegu"||address=="Jejudo")
        	    	number=2;
        	    if(address=="SEOUL")
        	    	number=1;
        	    if(address=="DAEJEON"||address=="Daejeon")
        	    	number=3;
        	    
        	    
        	  sql="INSERT INTO BAG VALUES(1,0,'n',NULL,'"+his_id+"',"+number+")";
        	  st.executeUpdate(sql);
        	  %>  
        	  alert("회원가입 완료되었습니다 로그인 하세요"); 
        	   <% 
            response.sendRedirect("login.jsp");        
            
        } catch (Exception e) {       
            out.println("DB 연동 실패");
        }    
    %>
 
</body>
</html>