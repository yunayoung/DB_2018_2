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
            out.println("���̵�-"+session.getAttribute("id"));
            %>
        
            <br /> <button> �α׾ƿ� </button>
            <br />
            <br /> </form>
            <br />
            <br />
             <br />
              <br />�˻�
              <form action ="itemresult.jsp">
            	<br />
                <br />   <input type="text"  name="itemname" ><br>
             <input type="submit" value="�˻�">
             </form>
              <br /> 
               <br /> 
             <br />������ (ī�װ���)
            <form action ="selectcate.jsp">
            <br /><select name ="some">
            <optgroup label="��з�-Safetygoods">
            <optgroup label="----------------------">
            	<optgroup label="�ߺз�-Faceshield">
            		<option value="11" name="11">Goggle</option>
            		<option value="12"name="11">Soundproof</option>
            		<option value="13"name="11">Soundproof</option>
            		</optgroup>
            	 </optgroup>
            	 <optgroup label="�ߺз�-Safetyshoes">
            	 <option value="21" name="11">wintershoes</option>
            		<option value="22"name="11">safetyshoes</option>
            		<option value="23"name="11">Workshoes</option>
            	 </optgroup>
            </optgroup>
            <optgroup label="��з�-IndustrialSupplay">
            <optgroup label="----------------------">
            	<optgroup label="�ߺз�-Light">
            		<option value="31" name="11">LEDlamp</option>
            		<option value="32"name="11">Work_lights</option>
            		<option value="33"name="11">Emitter</option>
            		</optgroup>
            	 </optgroup>
            	 <optgroup label="�ߺз�-Hose-rubber">
            	 <option value="41" name="11">Rubber_plate</option>
            		<option value="42"name="11">Hose</option>
            		<option value="43"name="11">Anti_vibration_ruber</option>
            	 </optgroup>
            </optgroup>
            <optgroup label="��з�-Business_equipment">
            <optgroup label="----------------------">
            	<optgroup label="�ߺз�-Welding">
            		<option value="51" name="11">Gaujingbong</option>
            		<option value="52"name="11">Tungsten_robs</option>
            		<option value="53"name="11">Submerged_material</option>
            		</optgroup>
            	 </optgroup>
            	 <optgroup label="�ߺз�-Voltage_converter">
            	 <option value="61" name="11">DC/ACinverter</option>
            		<option value="62"name="11">Down_trance</option>
            		<option value="63"name="11">Battery_charger</option>
            	 </optgroup>
            </optgroup>
            </select>
            <input type="submit" value="�����ۺ���">
            </form>
			<br /> 
			<br /> 
            <br /> <button onClick="location.href='PROFILE.jsp'"> �������� ����</button>
</body>
</html>