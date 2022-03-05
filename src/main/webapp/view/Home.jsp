
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.bean.UserBean" %>

<% UserBean utente = (UserBean) session.getAttribute("utente");  %>
<% UserBean manager = (UserBean) session.getAttribute("manager"); %>



<html>
<head>
    <title>Title</title>
</head>
<body>
<%if(utente == null && manager == null){%>
 <a href="LoginPage.jsp">Prova Login</a>
<%}else{%>
 <a href="../logout">Logout</a>
<%}%>
</body>
</html>
