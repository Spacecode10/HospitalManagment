<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="database.jsp" method="get">
Patient Name <input type="text" name="name">	
Address<textarea rows="" cols="" name="address"></textarea>
Date of Birth<input type="date" name="dob">
Marital Status
single<input type="radio" name="mstatus" value="single">
married<input type="radio" name="mstatus" value="married">
Contact Number<input type="text" name="number">
RegisteredDate <input type="date" name="date" readonly value=<%=java.time.LocalDate.now() %> >
LastVisitedDate  <input type="date" name="date" readonly>

<input type="submit">

</form>

</body>
</html>