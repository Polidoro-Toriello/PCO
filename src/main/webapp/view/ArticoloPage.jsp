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
<p><%=articoloBean.getPrezzo()%></p>
<p><%=articoloBean.getDescrizione()%></p>
<p><%=articoloBean.getQtaDisponibile()%></p>
<%if(articoloBean.getQtaDisponibile()>0){%>
<form action="../aggiungicarrello" method="get">
<select name="qta" id="qta">
<%for(int i=1; i<= articoloBean.getQtaDisponibile(); i++){%>
    <option value="<%=i%>"><%=i%></option>
<%}%>
</select>
    <button type="submit">Aggiungi al carrello </button>
</form>
<%}else{%>
<p>Articolo non disponibile</p>
<%}%>
</body>
</html>
