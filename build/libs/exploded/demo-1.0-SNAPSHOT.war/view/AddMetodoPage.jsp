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
                    <label for="email"><i class="fa fa-envelope"></i>&nbsp;Email</label>
                    <input type="text" id="Email" name="email"
                           placeholder="mariorossi@example.com">
                    <label for="card"><i class="fa fa-credit-card" aria-hidden="true"></i>&nbsp;Numero
                        sulla
                        carta</label>
                    <input type="text" id="card" name="Numerocarta"
                           placeholder="5101 **** **** **** 0121">
                </div>
                <div class="col-50">
                    <div class="row">
                        <div class="col-50">
                            <label for="scadenza"><i class="fa fa-calendar-check-o"
                                                     aria-hidden="true"></i>&nbsp;Scadenza</label>
                            <input type="text" id="scadenza" name="Scadenza"
                                   placeholder="27/08">
                        </div>
                        <div class="col-50">
                            <label for="cvv"><i class="fa fa-key" aria-hidden="true"></i>&nbsp;CVV</label>
                            <input type="text" id="cvv" name="Cvv" placeholder="670">
                        </div>
                    </div>
                    <label for="tipo"><i class="fa fa-institution"></i>&nbsp;Circuito
                        Carta</label>
                    <select name="Tipo" id="tipo">
                        <option value="Mastercard">Mastercard</option>
                        <option value="Visa">Visa</option>
                        <option value="Amex">American Express</option>
                        <option value="Maestro">Maestro</option>
                    </select>
                    <label for="cvv"></label>
                    <input type="hidden" id="hiddien" name="Cvv" placeholder="670">
                    <input type="submit" value="Salva" class="btnAdd">
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<%@include file="./fragment/footer.jsp" %>
</html>
