<%--
  Created by IntelliJ IDEA.
  User: G.TORIELLO
  Date: 05/03/2022
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="../addArticolo" method="get">
    <input type="text" name="Nome" placeholder="nome">
    <input type="text" name="Descrizione" placeholder="descrizione">
    <input type="text" name="IVA" placeholder="iva">
    <input type="text" name="Prezzo" placeholder="prezzo">
    <input type="text" name="Categoria" placeholder="categoria">
    <input type="text" name="Qta" placeholder="quantità">
    <button type="submit">Inserisci</button>
</form>
</body>
</html>
