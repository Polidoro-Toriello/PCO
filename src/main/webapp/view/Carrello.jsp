<%@ page import="model.bean.Carrello" %>
<%@ page import="model.bean.ArticoloCarrello" %><%--
  Created by IntelliJ IDEA.
  User: Riccardo
  Date: 03/05/2022
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Carrello c = (Carrello) session.getAttribute("carrello"); %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%if(c == null) { %>
    <p>Nessun articolo nel carrello</p>
<%}else{%>
<%for(ArticoloCarrello articolo: c.getArticoli()){%>
    <p>Nome:<%=articolo.getProduct().getNome()%></p>
    <p>Descrizione:<%=articolo.getProduct().getDescrizione()%></p>
    <p>Qta:<%=articolo.getQta()%></p>
    <p>Prezzo:<%=articolo.getProduct().getPrezzo()%></p>
    <hr>
<%}%>
<p>Totale: <%=c.getTotale()%></p>
<%}%>

</body>
</html>
