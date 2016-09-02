<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="pack.business.DataDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class = "pack.business.ProcessDao"/>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>** 회원자료 (MyBatis)**</title>
</head>
<body>
** 회원자료 (MyBatis)**<p>
<a href = "ins.jsp">회원추가</a><br>
<a href = "list.jsp?keyword=aa">id검색</a><br>
<a href = "list.jsp">전체보기</a><br>
<table border = "1">
	<tr><th>아이디</th><th>이름</th><th>비번</th><th>등록일</th></tr>
<% 
//ArrayList<DataDto> list = (ArrayList)processDao.selectDataAll();
//검색이 있는 경우
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
Map<String, String> map = new HashMap<String, String>();
map.put("search", keyword);
ArrayList<DataDto> list = (ArrayList)processDao.selectDataAll(map);
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");

if(list == null){
	out.println("<tr><td colspan = '4'>자료 없음</td></tr>");
}else{
	for(DataDto d:list){
%>
	<tr>
		<td><a href = "del.jsp?id=<%=d.getId() %>"><%=d.getId() %></a></td>
		<td><a href = "del.jsp?id=<%=d.getId() %>"><%=d.getName() %></a></td>
		<td><%=d.getPassword() %></td>
		<td><%=dateFormat.format(d.getRegdate()) %></td>
	</tr>
<%		
	}
}
%>
<tr><td colspan="4">id 클릭은 삭제, name 클릭은 수정</td></tr>
</table>
</body>
</html>