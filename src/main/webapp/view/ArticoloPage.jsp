<%@ page import="model.bean.ArticoloBean" %>
<%@ page import="java.util.Collection" %>
<%@ page import="model.dao.ArticoloDao" %>
<%@ page import="model.bean.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: G.TORIELLO
  Date: 06/03/2022
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Collection<ArticoloBean> articoli = ArticoloDao.doRetrieveAll();
    //Collection<ArticoloBean> articoli = session.getAttribute("articoli");
%>
<% UserBean utente = (UserBean) session.getAttribute("utente"); %>
<% UserBean manager = (UserBean) session.getAttribute("manager"); %>
<%ArticoloBean articoloBean = (ArticoloBean) session.getAttribute("articolo");%>
<html>
<head>
    <title>Title</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@100;500&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%@include file="./fragment/navbar.jsp" %>
<div class="small-container single-product">
    <div class="row">
        <div class="col-2">
            <img src="../immagini/RTX_3090_1.jpg" width="100%" id="product-img">
            <div class="small-img-row">
                <div class="small-img-col">
                    <img src="../immagini/RTX_3090_2.jpg" width="100%" class="small-img">
                </div>
                <div class="small-img-col">
                    <img src="../immagini/RTX_3090_3.jpg" width="100%" class="small-img">
                </div>
                <div class="small-img-col">
                    <img src="../immagini/RTX_3090_4.jpg" width="100%" class="small-img">
                </div>
                <div class="small-img-col">
                    <img src="../immagini/RTX_3090_1.jpg" width="100%" class="small-img">
                </div>
            </div>
        </div>
        <div class="col-2">
            <p>Categoria: <a href="#" class="linkCategoria"> <%=articoloBean.getCategoria().toUpperCase()%></a></p>
            <h1><%=articoloBean.getNome()%>
            </h1>
            <h4>Prezzo: <%=articoloBean.getPrezzo()%>&euro;</h4>
            <form action="../aggiungicarrello" method="get">
                <div class="productPage-btn">
                    <input value="<%=articoloBean.getIdArticolo()%>" name="idArticolo" type="hidden">
                    <input class="qtaSelect" type="number" value="1" max="<%=articoloBean.getQtaDisponibile()%>" name="qta">
                    <input type="submit" class="btnCarrello" value=" Aggiungi al Carrello"></div>
            </form>
            <h3> Dettagli Prodotto</h3>
            <br>
            <p><%=articoloBean.getDescrizione()%>
            </p>
        </div>
    </div>
</div>

<%@include file="./fragment/footer.jsp" %>
<!--- galleria ---->
<script>
    var product = document.getElementById("product-img");
    var smallImg = document.getElementsByClassName("small-img");
    smallImg[0].onclick = function () {
        product.src = smallImg[0].src;
    }

    smallImg[1].onclick = function () {
        product.src = smallImg[1].src;
    }
    smallImg[2].onclick = function () {
        product.src = smallImg[2].src;
    }
    smallImg[3].onclick = function () {
        product.src = smallImg[3].src;
    }
</script>
</body>
</html>
