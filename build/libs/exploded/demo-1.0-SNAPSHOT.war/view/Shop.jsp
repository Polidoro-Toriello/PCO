<%@ page import="java.util.Collection" %>
<%@ page import="model.bean.ArticoloBean" %>
<%@ page import="model.dao.ArticoloDao" %><%--
  Created by IntelliJ IDEA.
  User: G.TORIELLO
  Date: 06/03/2022
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Collection<ArticoloBean> articoli = ArticoloDao.doRetrieveAll();
    //Collection<ArticoloBean> articoli = session.getAttribute("articoli");
    for (ArticoloBean articolo : articoli) {
%>
<p><%=articolo.getNome()%>
</p>
<a href="../articolo?idArticolo=<%=articolo.getIdArticolo()%>">scegli</a>
<%}%>
</body>
</html>
