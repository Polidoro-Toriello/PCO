<%@ page import="model.bean.UserBean" %>
<%@ page import="model.bean.Carrello" %>
<%@ page import="model.bean.ArticoloCarrello" %>
<%--
  Created by IntelliJ IDEA.
  User: G.TORIELLO
  Date: 14/03/2022
  Time: 07:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserBean utente = (UserBean) session.getAttribute("utente"); %>
<% UserBean manager = (UserBean) session.getAttribute("manager");
    Carrello c = (Carrello) session.getAttribute("carrello");
%>

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
        <% if (c != null) {
            for (ArticoloCarrello articolo : c.getArticoli()) {
        %>
        <tr>
            <td>
                <div class="cart-info">
                    <img src="../immagini/NicePng_gaming-computer-png_2167532.png" alt="">
                    <div>
                        <small><%=articolo.getProduct().getNome()%>
                        </small><br>
                        <small><%=articolo.getProduct().getPrezzo()%>&euro;</small>
                        <br>
                        <a href="../rimuovicarrello?idArticolo=<%=articolo.getProduct().getIdArticolo()%>">Rimuovi</a>
                    </div>
                </div>
            </td>
            <td>
                <form action="../modificaquantitaarticolo?idArticolo=<%=articolo.getProduct().getIdArticolo()%>"
                      method="get">
                    <input value="<%=articolo.getProduct().getIdArticolo()%>" name="idArticolo" type="hidden">
                    <input type="number" max="<%=articolo.getProduct().getQtaDisponibile()%>" name="nuovaq"
                           onchange="this.form.submit()" value="<%=articolo.getQta()%>">
                </form>
            </td>
            <td><%=articolo.getQta()*articolo.getProduct().getPrezzo()%>&euro;</td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <!--Somma totale-->
    <div class="total-price">
        <table>
            <tr>
                <td>Iva</td>
                <td>22%</td>
            </tr>
            <tr>
                <td>Totale</td>
                <%if (c != null) {%>
                <td><%=c.getTotale()%>&euro;</td>
                <%} else {%>
                <td>0.0 &euro;</td>
                <%}%>
            </tr>
        </table>
    </div>
    <div class="carrelloButton">
        <form action="../confirmAcquisto" method="get">
            <input type="submit" class="confirmBtn" id="confirmBtn" value="Conferma Ordine">
        </form>
        <a class="returnBtn" id="returnBtn" href="Catalogo.jsp">Torna al catalogo</a>

    </div>
</div>
<%@include file="./fragment/footer.jsp" %>
</body>

