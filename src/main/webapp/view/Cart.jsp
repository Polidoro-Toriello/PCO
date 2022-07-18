<%@ page import="model.bean.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: G.TORIELLO
  Date: 14/03/2022
  Time: 07:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserBean utente = (UserBean) session.getAttribute("utente"); %>
<% UserBean manager = (UserBean) session.getAttribute("manager"); %>
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
    <title>Title</title>
</head>
<body>
<%@include file="./fragment/navbar.jsp" %>
<!--Dettagli del Carrello---->
<div class="small-container cart-page">
    <table>
        <tr>
            <th>Prodotto</th>
            <th>Quantita'</th>
            <th>Subtotal</th>
        </tr>
        <td>
            <div class="cart-info">
                <img src="../immagini/NicePng_gaming-computer-png_2167532.png" alt="">
                <div>
                    <small>NvidiaRTX</small><br>
                    <small>Prezzo: $780.00</small>
                    <br>
                    <a href="">Remove</a>
                </div>
            </div>
        </td>
        <td><input type="number" value=1></td>
        <td>$50.00</td>
    </table>

<!--Somma totale-->
    <div class="total-price">
        <table>
            <tr>
                <td>Subtotal</td>
                <td>50.00</td>
            </tr>
            <tr>
                <td>Iva</td>
                <td>22%</td>
            </tr>
            <tr>
                <td>Subtotal</td>
                <td>500</td>
            </tr>
        </table>
    </div>
</div>
<%@include file="./fragment/footer.jsp" %>
</body>

