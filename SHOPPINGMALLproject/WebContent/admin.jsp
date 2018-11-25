<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
     import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 페이지</title>
<style>
  table, th, td {
    border: 1px solid #bcbcbc;
  }
 
</style>
</head>
<body>
  <h1>관리자 페이지입니다</h1>
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
    %>
   <h4>-------------매출(전체, 월별, 일별)--------------</h4>
    <%
    String query="select I.Soldnum*Regulated_price from ITEM I";
    pstmt=conn.prepareStatement(query);
    rs= pstmt.executeQuery();
    
    double total_price [][] = new double [4][20];
    
    out.println("<table border = \"1\">");
  
   double sum=0;
    while(rs.next()){
       sum+=Integer.parseInt(rs.getString(1));
       }
    sum/=10000;
    out.println("<tr>");
    out.println("<td>"+"전체매출"+"</td>");  
    out.println("</tr>");
   out.println("<tr>");
   out.println("<td>"+String.valueOf(sum)+" (단위: 만원) "+"</td>");  
   out.println("</tr>");
   out.println("</table>");
   
   // 월별매출 금액 2016-09-01 and 2018-11-01
   
   int k=0, total=0;
   
   query=  "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "+
		   "from BAG b,PUT_IN p,ITEM i "+
		   "where b.ordered = 'y' "+
		   "and b.When_order between '2016-09-01' and '2016-10-01' "+
		   "and b.Bag_id=p.Bag_id "+
		   "and b.Customer_id = p.Customer_id "+
		   "and p.Item_id = i.Item_id "+
		   "group by i.Item_id ";
   
   pstmt=conn.prepareStatement(query);
   rs= pstmt.executeQuery();

    while(rs.next()){
      rs.getString(1);
      total+=Integer.parseInt(rs.getString(2));
       }
    
    total_price[0][9]=total;
   
   for(k=10;k<=11;k++){
	   
	   total=0;
	   query=  "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "+
			   "from BAG b,PUT_IN p,ITEM i "+
			   "where b.ordered = 'y' "+
			   "and b.When_order between '2016-"+k+"-01' and '2016-"+(k+1)+"-01' "+
			   "and b.Bag_id=p.Bag_id "+
			   "and b.Customer_id = p.Customer_id "+
			   "and p.Item_id = i.Item_id "+
			   "group by i.Item_id ";
	   
	   pstmt=conn.prepareStatement(query);
	   rs= pstmt.executeQuery();
	   
	    while(rs.next()){
	     rs.getString(1);
	      total+=Integer.parseInt(rs.getString(2));
	       }
	    
	    total_price[0][k]=total;
   }
   
   total=0;
   query=  "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "+
		   "from BAG b,PUT_IN p,ITEM i "+
		   "where b.ordered = 'y' "+
		   "and b.When_order between '2016-12-01' and '2017-01-01' "+
		   "and b.Bag_id=p.Bag_id "+
		   "and b.Customer_id = p.Customer_id "+
		   "and p.Item_id = i.Item_id "+
		   "group by i.Item_id ";
   
   pstmt=conn.prepareStatement(query);
   rs= pstmt.executeQuery();
      
    while(rs.next()){
      rs.getString(1);
      total+=Integer.parseInt(rs.getString(2));
       }
    total_price[0][12]=total;
    %>
    <tr></tr>
    <tr><tr/>
    <tr><tr/>
    <tr><tr/>
    <table border='1'>
    <tr>  <th>2016-09</th> <th>2016-10</th> <th>2016-11</th> <th>2016-12</th> </tr>
    <tr> <% for(int m=9;m<=12;m++){ %>
   	<td> <%= (int)total_price[0][m] %> 원 </td>
   	<% }
    %>
    </tr>
  	</table>
  	<tr><tr/>
    <tr><tr/>
<%
	// 2017년 월 매출 계산 시작
 	 for (k = 1; k <= 8; k++) {

		total = 0;
		query = "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "
				+ "from BAG b,PUT_IN p,ITEM i " + "where b.ordered = 'y' " + "and b.When_order between '2017-0"
				+ k + "-01' and '2017-0" + (k + 1) + "-01' " + "and b.Bag_id=p.Bag_id "
				+ "and b.Customer_id = p.Customer_id " + "and p.Item_id = i.Item_id " + "group by i.Item_id ";

		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			rs.getString(1);
			total += Integer.parseInt(rs.getString(2));
		}

		total_price[1][k] = total;
	}


	total = 0;
	query = "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "
			+ "from BAG b,PUT_IN p,ITEM i " + "where b.ordered = 'y' "
			+ "and b.When_order between '2017-09-01' and '2017-10-01' " + "and b.Bag_id=p.Bag_id "
			+ "and b.Customer_id = p.Customer_id " + "and p.Item_id = i.Item_id " + "group by i.Item_id ";

	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();

	while (rs.next()) {
		rs.getString(1);
		total += Integer.parseInt(rs.getString(2));
	}

	total_price[1][9] = total;

	for (k = 10; k <= 11; k++) {

		total = 0;
		query = "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "
				+ "from BAG b,PUT_IN p,ITEM i " + "where b.ordered = 'y' " + "and b.When_order between '2017-"
				+ k + "-01' and '2017-" + (k + 1) + "-01' " + "and b.Bag_id=p.Bag_id "
				+ "and b.Customer_id = p.Customer_id " + "and p.Item_id = i.Item_id " + "group by i.Item_id ";

		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			rs.getString(1);
			total += Integer.parseInt(rs.getString(2));
		}

		total_price[1][k] = total;
	}

	total = 0;
	query = "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "
			+ "from BAG b,PUT_IN p,ITEM i " + "where b.ordered = 'y' "
			+ "and b.When_order between '2017-12-01' and '2018-01-01' " + "and b.Bag_id=p.Bag_id "
			+ "and b.Customer_id = p.Customer_id " + "and p.Item_id = i.Item_id " + "group by i.Item_id ";

	pstmt = conn.prepareStatement(query);
	rs = pstmt.executeQuery();

	while (rs.next()) {
		rs.getString(1);
		total += Integer.parseInt(rs.getString(2));
	}
	total_price[1][12] = total;
%>
	
    <table border='1'>
    <tr> <% for(int m=1;m<=12;m++){ %>
   	<th>2017-<%=m%></th>
   	<% }
    %>
    </tr>

    <tr> <% for(int m=1;m<=12;m++){ %>
   	<td> <%= (int)total_price[1][m] %> 원 </td>
   	<% }
    %>
    </tr>
  	</table>
	<tr><tr/>
    <tr><tr/>
	<%
		// 2018년 월 매출 계산 시작
		for (k = 1; k <= 8; k++) {

			total = 0;
			query = "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "
					+ "from BAG b,PUT_IN p,ITEM i " + "where b.ordered = 'y' " + "and b.When_order between '2018-0"
					+ k + "-01' and '2018-0" + (k + 1) + "-01' " + "and b.Bag_id=p.Bag_id "
					+ "and b.Customer_id = p.Customer_id " + "and p.Item_id = i.Item_id " + "group by i.Item_id ";

			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rs.getString(1);
				total += Integer.parseInt(rs.getString(2));
			}

			total_price[2][k] = total;
		}

		total = 0;
		query = "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "
				+ "from BAG b,PUT_IN p,ITEM i " + "where b.ordered = 'y' "
				+ "and b.When_order between '2018-09-01' and '2018-10-01' " + "and b.Bag_id=p.Bag_id "
				+ "and b.Customer_id = p.Customer_id " + "and p.Item_id = i.Item_id " + "group by i.Item_id ";

		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			rs.getString(1);
			total += Integer.parseInt(rs.getString(2));
		}

		total_price[2][9] = total;

		for (k = 10; k <= 11; k++) {

			total = 0;
			query = "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "
					+ "from BAG b,PUT_IN p,ITEM i " + "where b.ordered = 'y' " + "and b.When_order between '2018-"
					+ k + "-01' and '2018-" + (k + 1) + "-01' " + "and b.Bag_id=p.Bag_id "
					+ "and b.Customer_id = p.Customer_id " + "and p.Item_id = i.Item_id " + "group by i.Item_id ";

			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				rs.getString(1);
				total += Integer.parseInt(rs.getString(2));
			}

			total_price[2][k] = total;
		}

		total = 0;
		query = "select i.Item_id as ITEM_ID,count(*)*i.Regulated_price as Total_PRICE "
				+ "from BAG b,PUT_IN p,ITEM i " + "where b.ordered = 'y' "
				+ "and b.When_order between '2018-12-01' and '2019-01-01' " + "and b.Bag_id=p.Bag_id "
				+ "and b.Customer_id = p.Customer_id " + "and p.Item_id = i.Item_id " + "group by i.Item_id ";

		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			rs.getString(1);
			total += Integer.parseInt(rs.getString(2));
		}
		total_price[2][12] = total;
	%>

	<table border='1'>
    <tr> <% for(int m=1;m<=12;m++){ %>
   	<th>2018-<%=m%></th>
   	<% }
    %>
    </tr>

    <tr> <% for(int m=1;m<=12;m++){ %>
   	<td> <%= (int)total_price[2][m] %> 원 </td>
   	<% }
    %>
    </tr>
  	</table>  	
  	
  	<form action="date_sale.jsp" method="post" >
      <br />날짜(0000-00-00) : <input name="date" type="text"> 
      <br /><input type = "submit" value="날짜검색" > <input type = "button" value ="취소">
      </form>
  	
  	
  	

   <h4>-------------배송 업체 별 배송 횟수--------------</h4>
    <%
    
   query="select S.Shipping_name, count(*) "+
		   "from SHIPPING S, BAG B "+
		   "where B.Shipping_id=S.Shipping_id "+
		   "group by S.Shipping_id";
    pstmt=conn.prepareStatement(query);
    rs= pstmt.executeQuery();
    
    out.println("<table border = \"1\">");
   
    ResultSetMetaData rsmd =rs.getMetaData();
    int cnt = rsmd.getColumnCount();
    for(int i=1;i<=cnt;i++){
    	
    	out.println("<th>"+rsmd.getColumnName(i)+"</th>");
    }
    
    while(rs.next()){
    	
    	out.println("<tr>");
    	out.println("<td>"+rs.getString(1)+"</td>");
    	out.println("<td>"+rs.getString(2)+"</td>");
    	out.println("</tr>");
    	
    }
    		
    out.println("</table>");
    %>
        
    
     <h4>-------------재고 부족한 아이템 리스트 --------------</h4>
    <%
    
//    query="CREATE VIEW SUM1 as "+ 
// 		   "select I.Item_id , sum(P.Item_num) as sum1 "+
// 		   "from ITEM I ,BAG B , PUT_IN P "+
// 		   "where I.Item_id = P.Item_id "+
// 		   "and B.Bag_id=P.Bag_id "+
// 		   "and B.Customer_id = P.Customer_id "+
// 		   "and B.Ordered = 'n' "+
// 		   "group by I.Item_id ";
//     pstmt=conn.prepareStatement(query);
//     rs= pstmt.executeQuery();
    
    query="select S.Item_id as ITEMTOBUYs, I.Inum as stocknum, S.sum1 as ordernum "+
    		"from ITEM I, SUM1 S "+
    		"where I.Inum<S.sum1 "+
    		"and I.Item_id = S.Item_id";
    
    pstmt=conn.prepareStatement(query);
    rs= pstmt.executeQuery();
    
    out.println("<table border = \"1\">");
   
    rsmd =rs.getMetaData();
    cnt = rsmd.getColumnCount();
    for(int i=1;i<=cnt;i++){
    	
    	out.println("<th>"+rsmd.getColumnName(i)+"</th>");
    }
    
    while(rs.next()){
    	
    	out.println("<tr>");
    	out.println("<td>"+rs.getString(1)+"</td>");
    	out.println("<td>"+rs.getString(2)+"</td>");
    	out.println("<td>"+rs.getString(3)+"</td>");
    	out.println("</tr>");
    	
    }
    		
    out.println("</table>");
    %>
    
    
    <h4>-------------재고 업데이트--------------</h4>
	<form action="stock.jsp" method="post" >
      <br />품명번호 <input name="item_id" type="text" > 
      <br />재고개수 <input name="item_num" type="text"> 
      <br /><input type = "submit" value="재고확보" > <input type = "button" value ="취소">
      </form>
   
</body>
</html>