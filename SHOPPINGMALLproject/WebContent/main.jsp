<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
            <br />
            <br />
             <br />
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
            		<option value="13"name="11">Soundproof</option>
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
</body>
</html>