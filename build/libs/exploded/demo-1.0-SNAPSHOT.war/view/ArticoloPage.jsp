<%@ page import="model.bean.ArticoloBean" %><%--
  Created by IntelliJ IDEA.
  User: G.TORIELLO
  Date: 06/03/2022
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%ArticoloBean articoloBean = (ArticoloBean) session.getAttribute("articolo");%>
<p><%=articoloBean.getNome()%></p>
</body>
</html>
