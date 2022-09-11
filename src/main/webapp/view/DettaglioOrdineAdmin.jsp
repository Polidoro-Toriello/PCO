<%--
  Created by IntelliJ IDEA.
  User: Riccardo
  Date: 09/09/2022
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.ComposizioneOrdine" %>
<% ArrayList<ComposizioneOrdine> articoli = (ArrayList<ComposizioneOrdine>) session.getAttribute("dettaglioordinead");%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%for(ComposizioneOrdine cp: articoli){%>
<p><%=cp.getIdOrdine()%></p>
<p><%=cp.getNome()%></p>
<p><%=cp.getDescrizione()%></p>
<p><%=cp.getPrezzo()%></p>
<p><%=cp.getQuantita()%></p>
<p><%=cp.getIva()%></p>
<%}%>
</body>
</html>
