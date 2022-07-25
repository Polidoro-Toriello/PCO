<%@ page import="model.bean.UserBean" %>
<%--  Created by IntelliJ IDEA.
  User: nucle
  Date: 23/07/2022
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@100;500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../style.css">
    <script src="${pageContext.request.contextPath}/js/appFunction.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<% UserBean utente = (UserBean) session.getAttribute("utente"); %>
<% UserBean manager = (UserBean) session.getAttribute("manager");%>
<body>
<%@include file="./fragment/navbar.jsp" %>
<div class="riga">
    <div class="col-75">
        <form action="../aggiungimetodo" method="get">
            <div class="row">
                <div class="col-50">
                    <h3>Aggiungi Metodo</h3>
                    <br>
                    <div class="row">
                        <div class="col-50">
                            <label for="fname"><i class="fa fa-user"></i>&nbsp;Nome</label>
                            <input type="text" id="fname" name="Nome" placeholder="Mario">
                        </div>
                        <div class="col-50">
                            <label for="lname"><i class="fa fa-user"></i>&nbsp;Cognome</label>
                            <input type="text" id="lname" name="Cognome" placeholder="Rossi">
                        </div>
                    </div>

                    <label for="Via"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;Indirizzo</label>
                    <input type="text" id="Via" name="Via" placeholder="Via Roma 11">

                    <label for="Citta"><i class="fa fa-city" aria-hidden="true"></i>&nbsp;Citta'</label>
                    <input type="text" id="Citta" name="Citta" placeholder="Salerno">

                </div>
                <div class="col-50">
                    <label for="Provincia"><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;Provincia</label>
                    <input type="text" id="Provincia" name="Provincia" placeholder="Salerno">

                    <label for="Cap"><i class="fa fa-dot-circle-o" aria-hidden="true"></i>&nbsp;Cap</label>
                    <input type="text" id="Cap" name="Cap" placeholder="84121">

                    <label for="Cellulare"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;Cellulare</label>
                    <input type="text" id="Cellulare" name="Cellulare"
                           placeholder="350 6780929">
                </div>
                <input type="submit" value="Salva" class="modifica">
            </div>
        </form>
    </div>
</div>
</body>
<%@include file="./fragment/footer.jsp" %>
</html>
