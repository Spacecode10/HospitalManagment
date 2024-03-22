<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
            //String dname = request.getParameter("dname");
	    int pid = Integer.parseInt(request.getParameter("pid"));
          String date=request.getParameter("adate");
            response.setContentType("text/html");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ass3","root","1234");
            PreparedStatement ps=con.prepareStatement("insert into appointment (appointment_date,Patient_id) values(?,?)");
            ps.setString(1, date);
            ps.setInt(2, pid);
            ps.executeUpdate();
            ps=con.prepareStatement("update Patient set LastVisitedDate=? where  Patient_id=? ");
            ps.setString(1, date);
            ps.setInt(2, pid);
            ps.executeUpdate();
             ps=con.prepareStatement("select app_id from appointment where Patient_id=?");
            ps.setInt(1,pid);
            ResultSet rs= ps.executeQuery();
            rs.next();
           int appid=rs.getInt(1);
          out.println("your appointment id is "+appid);
           // RequestDispatcher r = request.getRequestDispatcher("ScheduleAppointment.jsp");
            //r.forward(request, response);
			%>	
</body>
</html>