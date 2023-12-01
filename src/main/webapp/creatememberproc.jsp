<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//sql 입력처리 전 데이터가 올바르게 전송되는지 반드시 확인 후 입력처리할 것
request.setCharacterEncoding("utf-8");

int custno=Integer.parseInt(request.getParameter("custno"));
String custname=request.getParameter("custname");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String joindate=request.getParameter("joindate");
String grade=request.getParameter("grade");
String city=request.getParameter("city");

/*
out.print(custno+"<br>");
out.print(custname+"<br>");
out.print(phone+"<br>");
out.print(address+"<br>");
out.print(joindate+"<br>");
out.print(grade+"<br>");
out.print(city+"<br>");
*/
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection(
		"jdbc:oracle:thin:@localhost:1521:xe"
		,"system"
		, "1234");
String sql="insert into member_tbl_02 values(?,?,?,?,?,?,?)";

/*
String sql="insert into 
member_tbl_02(custno,custname,phone,address,joindate,grade,city) 
values(?,?,?,?,?,?,?)";
*/
PreparedStatement ps=conn.prepareStatement(sql);
ps.setInt(1, custno);
ps.setString(2, custname);
ps.setString(3, phone);
ps.setString(4, address);
ps.setString(5, joindate);
ps.setString(6, grade);
ps.setString(7, city);
int result=ps.executeUpdate();
ps.close();conn.close();
%>
<script>
alert("회원등록이 완료 되었습니다!");
history.back();
</script>

<%
if(result>0){
%>
<script>
//alert("회원등록이 완료 되었습니다!")
//location.href="index.jsp"
</script>
<%}else{%>
<script>
//alert("회원등록에 오류가 있습니다.!")
//history.back();
</script>
<%}%>











