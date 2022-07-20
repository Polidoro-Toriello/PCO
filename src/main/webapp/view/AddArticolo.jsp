
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.bean.UserBean" %>
<% UserBean manager = (UserBean) session.getAttribute("manager");
    if(manager == null)
    {
        request.getSession().setAttribute("alertMsg","Errore!Accesso non consentito!");
        response.sendRedirect("./LoginPage.jsp");
    }

%>
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
    <select name="Categoria" id="categoria">
        <option value="ram">RAM</option>
        <option value="cpu">CPU</option>
        <option value="gpu">GPU</option>
        <option value="ssd">SSD</option>
        <option value="hdd">HDD</option>
        <option value="pc">PC</option>
    </select>
    <input type="text" name="Qta" placeholder="quantità">
    <button type="submit">Inserisci</button>
</form>
</body>
</html>
