<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
            <h1> Y&J SHOPPINGMALL </h1> 
            <br /> <form action="logout.jsp" method="post">
            <%
            out.println("아이디-"+session.getAttribute("id"));
            %>
        
            <br /> <button> 로그아웃 </button>
            <br />
            <br /> </form>
      
           	<%
		String strUserName = "dkelab";
		String strPassword = "dkelab522";
		String strConnectString = "jdbc:mysql://155.230.36.58:3306/test";
		String DBMS_DRIVER_CLASS_NAME = "com.mysql.cj.jdbc.Driver";
		Connection conn = null;
		ResultSet rs;
		PreparedStatement pstmt;

		try {
			// Load a JDBC driver for Oracle DBMS
			Class.forName(DBMS_DRIVER_CLASS_NAME);
			// Get a Connection object 
			System.out.println("Success!");
		} catch (ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}

		try {

			conn = DriverManager.getConnection(strConnectString, strUserName, strPassword);
		} catch (SQLException ex) {
			System.err.println("Cannot get a connection: " + ex.getMessage());
			System.exit(1);
		}
	%>
	<%
	
	 String query="select b.Bag_id "+
			 "from CUSTOMER c, BAG b "+
			 "where c.Customer_id='"+session.getAttribute("id")+"' "+ 
			 "and b.Customer_id = c.Customer_id "+
			 "and b.When_order is NULL";
	
	int check=0;
	String sex=null, age=null,type_c=null, address=null;
    pstmt=conn.prepareStatement(query);
    rs= pstmt.executeQuery();
    
    while(rs.next()){
    	check=Integer.parseInt(rs.getString(1));
    }
    
    if(check >0 && check <= 2){%>
    
    	<br><br>
        <b><font size="3" color="gray"> 신규회원, <%=session.getAttribute("id") %> 님! 반갑습니다.
        <br> 추천상품 목록들입니다 </font></b>
        
        <br><br>    
    	<% 
    	query= "select sex, age, type, address "+
    			"from CUSTOMER "+
    			"where Customer_id = '"+session.getAttribute("id")+"'";
    	
    	pstmt=conn.prepareStatement(query);
        rs= pstmt.executeQuery();
        
        while(rs.next()){
        sex = rs.getString(1); 
        age = rs.getString(2);
        type_c = rs.getString(3); 
        address= rs.getString(4);
        }
      %>
      <font color="blue">"<%=type_c %>"타입의 Top3 물품 </font> 
      <%   
        query = "select I.Item_id, I.Iname "+
        		"from BAG B, PUT_IN P, ITEM I,CUSTOMER C "+
        		"where C.type='"+type_c+"' "+
        		"and B.Customer_id=C.Customer_id "+
        		"and B.ordered = 'y' "+
        		"and B.Bag_id = P.Bag_id "+
        		"and P.Item_id=I.item_id "+
        		"group by I.Item_id, I.Iname "+
        		"order by count(*) desc "+
        		"limit 3";
        
        pstmt=conn.prepareStatement(query);
        rs= pstmt.executeQuery();
        out.println("<table border = \"1\">");
        out.println("<th>"+"품별번호"+"</th>");
        out.println("<th>"+" 품명 "+"</th>");
        while(rs.next()){
        	
        	out.println("<tr>");
        	out.println("<td>"+rs.getString(1)+"</td>");
        	out.println("<td>"+rs.getString(2)+"</td>");
        	out.println("</tr>");
        	
        }
        		
        out.println("</table>"); 
        %> 
         <font color="blue">"<%=sex %>"타입의 Top3 물품 </font> 
        <%  
        query = "select I.Item_id, I.Iname "+
        		"from BAG B, PUT_IN P, ITEM I,CUSTOMER C "+
        		"where C.sex='"+sex+"' "+
        		"and B.Customer_id=C.Customer_id "+
        		"and B.ordered = 'y' "+
        		"and B.Bag_id = P.Bag_id "+
        		"and P.Item_id=I.item_id "+
        		"group by I.Item_id, I.Iname "+
        		"order by count(*) desc "+
        		"limit 3";
        
        pstmt=conn.prepareStatement(query);
        rs= pstmt.executeQuery();
        out.println("<table border = \"1\">");
        out.println("<th>"+"품별번호"+"</th>");
        out.println("<th>"+" 품명 "+"</th>");
        while(rs.next()){
        	
        	out.println("<tr>");
        	out.println("<td>"+rs.getString(1)+"</td>");
        	out.println("<td>"+rs.getString(2)+"</td>");
        	out.println("</tr>");
        	
        }
        		
        out.println("</table>");
        
        %> 
        <font color="blue">"<%=age %>" 비슷한 연령층 Top3 물품 </font> 
       <%  
       int a1=0,a2=0;
       a1 = Integer.parseInt(age)-5; a2= Integer.parseInt(age)+5;
       query = "select I.Item_id, I.Iname "+
       		"from BAG B, PUT_IN P, ITEM I,CUSTOMER C "+
       		"where C.age > "+ Integer.toString(a1) +" and C.age < "+ Integer.toString(a2)+
       		" and B.Customer_id=C.Customer_id "+
       		"and B.ordered = 'y' "+
       		"and B.Bag_id = P.Bag_id "+
       		"and P.Item_id=I.item_id "+
       		"group by I.Item_id, I.Iname "+
       		"order by count(*) desc "+
       		"limit 3";
       
       pstmt=conn.prepareStatement(query);
       rs= pstmt.executeQuery();
       out.println("<table border = \"1\">");
       out.println("<th>"+"품별번호"+"</th>");
       out.println("<th>"+" 품명 "+"</th>");
       while(rs.next()){
       	
       	out.println("<tr>");
       	out.println("<td>"+rs.getString(1)+"</td>");
       	out.println("<td>"+rs.getString(2)+"</td>");
       	out.println("</tr>");
       	
       }
       		
       out.println("</table>");
       
       %> 
       <font color="blue">"<%=sex %>"주소의 Top3 물품 </font> 
      <%  
      query = "select I.Item_id, I.Iname "+
      		"from BAG B, PUT_IN P, ITEM I,CUSTOMER C "+
      		"where C.address='"+address+"' "+
      		"and B.Customer_id=C.Customer_id "+
      		"and B.ordered = 'y' "+
      		"and B.Bag_id = P.Bag_id "+
      		"and P.Item_id=I.item_id "+
      		"group by I.Item_id, I.Iname "+
      		"order by count(*) desc "+
      		"limit 3";
      
      pstmt=conn.prepareStatement(query);
      rs= pstmt.executeQuery();
      out.println("<table border = \"1\">");
      out.println("<th>"+"품별번호"+"</th>");
      out.println("<th>"+" 품명 "+"</th>");
      while(rs.next()){
      	
      	out.println("<tr>");
      	out.println("<td>"+rs.getString(1)+"</td>");
      	out.println("<td>"+rs.getString(2)+"</td>");
      	out.println("</tr>");
      	
      }
      		
      out.println("</table>");
    	
    }
    	
	%>
              
              <br />검색
              <form action ="itemresult.jsp">
            	<br />
                <br />   <input type="text"  name="itemname" ><br>
             <input type="submit" value="검색">
             </form>
              <br /> 
               <br /> 
             <br />아이템 (카테고리별)
            <form action ="selectcate.jsp">
            <br /><select name ="some">
            <optgroup label="대분류-Safetygoods">
            <optgroup label="----------------------">
            	<optgroup label="중분류-Faceshield">
            		<option value="11" name="11">Goggle</option>
            		<option value="12"name="11">Soundproof</option>
            		<option value="13"name="11">Glasses</option>
            		</optgroup>
            	 </optgroup>
            	 <optgroup label="중분류-Safetyshoes">
            	 <option value="21" name="11">wintershoes</option>
            		<option value="22"name="11">safetyshoes</option>
            		<option value="23"name="11">Workshoes</option>
            	 </optgroup>
            </optgroup>
            <optgroup label="대분류-IndustrialSupplay">
            <optgroup label="----------------------">
            	<optgroup label="중분류-Light">
            		<option value="31" name="11">LEDlamp</option>
            		<option value="32"name="11">Work_lights</option>
            		<option value="33"name="11">Emitter</option>
            		</optgroup>
            	 </optgroup>
            	 <optgroup label="중분류-Hose-rubber">
            	 <option value="41" name="11">Rubber_plate</option>
            		<option value="42"name="11">Hose</option>
            		<option value="43"name="11">Anti_vibration_ruber</option>
            	 </optgroup>
            </optgroup>
            <optgroup label="대분류-Business_equipment">
            <optgroup label="----------------------">
            	<optgroup label="중분류-Welding">
            		<option value="51" name="11">Gaujingbong</option>
            		<option value="52"name="11">Tungsten_robs</option>
            		<option value="53"name="11">Submerged_material</option>
            		</optgroup>
            	 </optgroup>
            	 <optgroup label="중분류-Voltage_converter">
            	 <option value="61" name="11">DC/ACinverter</option>
            		<option value="62"name="11">Down_trance</option>
            		<option value="63"name="11">Battery_charger</option>
            	 </optgroup>
            </optgroup>
            </select>
            <input type="submit" value="아이템보기">
            </form>
			<br /> 
			<br /> 
            <br /> <button onClick="location.href='PROFILE.jsp'"> 개인정보 변경</button>
            <button onClick="location.href='myorder_list.jsp'"> 구매내역 조회</button>
            
</body>
</html>