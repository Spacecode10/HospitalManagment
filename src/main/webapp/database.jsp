<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
            String name = request.getParameter("name");
	    String dob = request.getParameter("dob");
            String add = request.getParameter("address");
            String status = request.getParameter("mstatus");
            String contact = request.getParameter("number");
            String date = request.getParameter("date");
            response.setContentType("text/html");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ass3","root","1234");
            PreparedStatement ps=con.prepareStatement("insert into Patient(Patient_Name,Address,DOB,Marital_Status,Contact_Number,RegisteredDate,LastVisitedDate) values(?,?,?,?,?,?,?)");
            ps.setString(1,name);
            ps.setString(3,dob);
            ps.setString(2,add);
            ps.setString(4,status);
            ps.setString(5,contact);
            ps.setString(6,date);
            ps.setString(7,date);
            ps.executeUpdate();
            String q="select Patient_ID from Patient where Contact_Number=?";
            ps=con.prepareStatement(q);
            ps.setString(1, contact);
            ResultSet rs=ps.executeQuery();
            rs.next();
            int pid=rs.getInt(1);
        	request.setAttribute("pid", pid);
            con.close();
            RequestDispatcher r = request.getRequestDispatcher("ScheduleAppointment.jsp");
            r.forward(request, response);
			%>	
</body>
</html>