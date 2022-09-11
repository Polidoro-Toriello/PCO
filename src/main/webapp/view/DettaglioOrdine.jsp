<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.ComposizioneOrdine" %>
<%@ page import="model.bean.UserBean" %>

<% UserBean utente = (UserBean) session.getAttribute("utente"); %>
<% UserBean manager = (UserBean) session.getAttribute("manager"); %>
<% ArrayList<ComposizioneOrdine> articoli = (ArrayList<ComposizioneOrdine>) session.getAttribute("dettaglioordine");%>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@100;500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dettaglio ordine</title>
</head>
<body>
<%@include file="./fragment/navbar.jsp" %>

<table class="table-responsive-sm" id="tabellautenti">
    <thead>
    <tr>
        <td>Nome</td>
        <td>Descrizione</td>
        <td>Prezzo</td>
        <td>Quantità</td>
        <td>IVA</td>
    </tr>
    </thead>
    <tbody>
    <%for(ComposizioneOrdine cp: articoli){%>
    <tr>
        <td><%=cp.getNome()%></td>
        <td><%=cp.getDescrizione()%></td>
        <td><%=cp.getPrezzo()%></td>
        <td><%=cp.getQuantita()%></td>
        <td><%=cp.getIva()%></td>
    </tr>
    <%}%>
    </tbody>
</table>
<%@include file="./fragment/footer.jsp" %>
</body>
</html>