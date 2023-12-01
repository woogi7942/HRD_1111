<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mylib.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//여러데이터를 리스트에 담아서 아래쪽에서 한번에 출력한다.
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection(
		"jdbc:oracle:thin:@localhost:1521:xe"
		, "system"
		,"1234");
String sql="select * from member_tbl_02";
PreparedStatement ps=conn.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
List<Member> list=new ArrayList<Member>();
while(rs.next()){
	Member member=new Member();
	member.setCustno(rs.getInt("custno"));
	member.setCustname(rs.getString("custname"));
	member.setPhone(rs.getString("phone"));
	member.setAddress(rs.getString("address"));
	member.setJoindate(rs.getDate("joindate"));
	member.setGrade(rs.getString("grade"));
	member.setCity(rs.getString("city"));
	list.add(member);
}
rs.close();ps.close();conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{margin:0;padding:0;}
header{
	background-color:rgba(0,0,255);
	height:100px;
	color:white;
	font-size:30px;
	text-align:center;
	line-height:100px; 
	/* padding:20px auto; */ /* 위아래 좌우 */
	}
nav{background-color:rgba(100,0,255,0.5); color:white;/* text-align:center; */}
nav > ul > li{
	display:inline-block;
	padding:20px 30px;
	}
section{height:500px; background-color:rgba(220,220,220);}
section > h2 {
text-align:center;
padding-top:20px;
padding-bottom:20px;
}
footer{
background-color:rgba(0,0,255);
	height:100px;
	color:white;
	font-size:15px;
	text-align:center;
	line-height:100px; }
table{
margin:auto;
text-align:center;
}
a{
color:white;
}
li a{
color:white;
text-decoration: none;
}
</style>
</head>
<body>
<header>쇼핑몰 회원관리 ver1.0</header>
<nav>
<ul>
<li><a href="createmember.jsp">회원등록</a></li>
<li><a href="memberlist.jsp">회원목록조회/수정</a></li>
<li><a href="sales.jsp">회원매출조회</a></li>
<li><a href="index.jsp">홈으로.</a></li>
</ul>
</nav>
<section>
<h2>회원목록조회/수정</h2>
<p>
<table border="1" width="60%">
<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>전화번호</th>
	<th>주소</th>
	<th>가입일자</th>
	<th>고객등급</th>
	<th>거주지역</th>
</tr>
<%for(Member m:list){ %>
<tr>
	<td><a href="update.jsp?custno=<%=m.getCustno() %>"><%=m.getCustno() %></a></td>
	<td><%=m.getCustname() %></td>
	<td><%=m.getPhone() %></td>
	<td><%=m.getAddress() %></td>
	<%
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
	%>
	<td><%=sdf.format(m.getJoindate()) %></td>
	<%-- <td><%=m.getJoindate() %></td> --%>
	<%-- <td><%=m.getGrade().charAt(0)=='A'?"VIP":"일반"%></td> --%>
	<td><%=m.getGrade().equals("A")?"VIP"
			:m.getGrade().equals("B")?"일반":"직원"%></td>
	<td><%=m.getCity() %></td>	
</tr>
<%}%>
</table>
</p>
</section>
<footer>
HRDKOREA Copyright
</footer>
</body>
</html>