<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="document.location='NewPatient.jsp'">New Patient Click Here</button>
<form action="submitappointment.jsp" method="get">
Patient Id<input type="text" name="pid" id="1">
		  <%
            response.setContentType("text/html");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ass3","root","1234");
            Statement st=con.createStatement();
            String q="select Doctor_Name from Doctor";
            ResultSet rs = st.executeQuery(q);
            out.println("<select name='cars' id='cars'>");
            while(rs.next())
            {
            String fname = rs.getString(1); 
            %>
            <option value="<%=fname%>"><%=fname %></option>
            <%
           	 }
            out.println("</select>");%>
          <%=request.getAttribute("pid")%>
Appointment Date<input type="date" name="adate">
Payment
pending<input type="radio" name="payment" id="2" onclick="pending(this);">
done<input type="radio" name="payment" id="3" onclick="done(this);">
<p id="insertinputs"></p>
Status<input type="text" readonly placeholder="Active">
<input type="submit">
</form>
</body>
<script type="text/javascript">
			{if(<%=request.getAttribute("pid")%>!=null)
			document.getElementById("1").value="<%=request.getAttribute("pid")%>";
			}
			function pending(cbox)
			{
				if (cbox.checked) {
				    var input = document.createElement("input");
				    input.type = "text";
				    var div = document.createElement("div");
				    div.id = cbox.name;
				    div.innerHTML = "Text to display for " + cbox.name;
				    div.appendChild(input);
				    document.getElementById("insertinputs").appendChild(div);
				  } else {
				    document.getElementById(cbox.name).remove();
				  }
			}
</script>
</html>