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
<% UserBean utente = (UserBean) session.getAttribute("utente");%>
<% session.setAttribute("paginaCorrente", "ArticoloPage.jsp");%>
<% String aggiunto = (String) session.getAttribute("alertMsg"); %>
<% UserBean manager = (UserBean) session.getAttribute("manager"); %>
<%ArticoloBean articoloBean = (ArticoloBean) session.getAttribute("articolo");
if(articoloBean==null){
    response.sendRedirect(request.getContextPath()+"/home");
    return;
}%>

<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/igorlino/elevatezoom-plus@1.2.3/src/jquery.ez-plus.js"></script>
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
<%
    if (aggiunto != null && aggiunto.equals("true")) {
%>
<div id="aggiunto" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <p>L'articolo è stato aggiunto al carrello</p>
        <div class="modal-content-btn">
            <a class="btn" href="Carrello.jsp" id="btnPiccolo">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor"
                     class="bi bi-bag" viewBox="0 0 16 16">
                    <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                </svg>
                Vai al Carrello </a>
        </div>
    </div>
</div>
<%}%>
<script>
    // When the user clicks on <span> (x), close the modal
    var span = document.getElementsByClassName("close")[0];
    var modal = document.getElementById("aggiunto")
    span.onclick = function () {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
<% //possibilità di mettere anchore per farlo apparire centrale
    session.removeAttribute("alertMsg");%>
<div class="small-container single-product" style="width: 100%">
    <div class="row">
        <div class="col-2">
            <img src="../immagini/<%=articoloBean.getCategoria().toLowerCase()%>1.jpg" data-zoom-img="../immagini/<%=articoloBean.getCategoria().toLowerCase()%>1.jpg" width="500px" height="500px" id="product-img">
            <div class="small-img-row">
                <% for (int i = 1; i <= 4; i++) {%>
                <div class="small-img-col">
                    <img  src="../immagini/<%=articoloBean.getCategoria().toLowerCase()+i%>.jpg" class="small-img">
                </div>
                <%}%>
            </div>
        </div>
        <div class="col-2">
            <p>Categoria: <a href="#" class="linkCategoria"><%=articoloBean.getCategoria().toUpperCase()%>
            </a></p>
            <h1><%=articoloBean.getNome()%>
            </h1>
            <h4>Prezzo: <%=articoloBean.getPrezzo()%>&euro;</h4>
            <form action="../aggiungicarrello" method="get">
                <div class="productPage-btn">
                    <input value="<%=articoloBean.getIdArticolo()%>" name="idArticolo" type="hidden">
                    <input class="qtaSelect" type="number" value="1" max="<%=articoloBean.getQtaDisponibile()%>"
                           name="qta">
                    <input type="submit" class="btnCarrello" value=" Aggiungi al Carrello"></div>
            </form>
            <h3> Dettagli Prodotto</h3>
            <br>
            <p><%=articoloBean.getDescrizione()%>
            </p>
        </div>
    </div>
</div>
<br>
<section class="articoliHome" id="articoliHome">

    <h2 class="title">Ultimi Arrivi</h2>

    <div class="box-container">
        <%for (ArticoloBean articolo : articoli) {%>
        <div class="box">
            <%if (articolo.getCategoria().equalsIgnoreCase("gpu")) {%>
            <div class="image">
                <img src="<%="../immagini/gpu1.jpg"%>" alt="gpu">
            </div>
            <%}%>
            <%if (articolo.getCategoria().equalsIgnoreCase("pc")) {%>
            <div class="image">
                <img src="<%="../immagini/pc1.jpg"%>" alt="pc">
            </div>
            <%}%>
            <%if (articolo.getCategoria().equalsIgnoreCase("cpu")) {%>
            <div class="image">
                <img src="<%="../immagini/cpu1.jpg"%>" alt="cpu">
            </div>
            <%}%>
            <%if (articolo.getCategoria().equalsIgnoreCase("ram")) {%>
            <div class="image">
                <img src="<%="../immagini/ram1.jpg"%>" alt="ram">
            </div>
            <%}%>
            <%if (articolo.getCategoria().equalsIgnoreCase("ssd")) {%>
            <div class="image">
                <img src="<%="../immagini/ssd1.jpg"%>" alt="ssd">
            </div>
            <%}%>
            <%if (articolo.getCategoria().equalsIgnoreCase("hdd")) {%>
            <div class="image">
                <img src="<%="../immagini/hdd1.jpg"%>" alt="hdd">
            </div>
            <%}%>
            <div class="info">
                <h3><%=articolo.getNome()%>
                </h3>
                <div class="subInfo">
                    <strong class="price"><%=articolo.getPrezzo()%>&euro;</strong>
                    <a class="btn" href="../articolo?idArticolo=<%=articolo.getIdArticolo()%>">Vai al Prodotto</a>
                    <a class="btn" id="aggiungiCarrello"
                       href="../aggiungicarrello?idArticolo=<%=articolo.getIdArticolo()%>&qta=1">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor"
                             class="bi bi-bag" viewBox="0 0 16 16">
                            <path
                                    d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                        </svg>
                        Aggiungi al Carrello</a>
                </div>
            </div>
        </div>
        <%}%>
    </div>
</section>
<div class="offer">
    <div class="small-container">
        <div class="row">
            <div class="col-2">
                <img class="offer-img" src="../immagini/NicePng_gaming-computer-png_2167532.png" alt="">
            </div>
            <div class="col-2">
                <p>Exclusively Available on PCO</p>
                <h1>Hp Pavillion Gaming 15</h1>
                <small>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloremque nostrum perspiciatis
                    neque
                    velit beatae maiores saepe ex quia rerum voluptate nihil, quisquam dolor minus voluptatibus,
                    molestiae quis necessitatibus vero.</small>
                <input type="submit" class="btn" value="Acquista">
            </div>
        </div>
    </div>
</div>
<%@include file="./fragment/footer.jsp" %>
<!--- galleria ---->
<script>
    var product = document.getElementById("product-img");
    var smallImg = document.getElementsByClassName("small-img");
    $('#product-img').ezPlus();
    smallImg[0].onclick = function () {
        product.src = smallImg[0].src;
        $('#product-img').ezPlus();
    }

    smallImg[1].onclick = function () {
        product.src = smallImg[1].src;
        $('#product-img').ezPlus();
    }
    smallImg[2].onclick = function () {
        product.src = smallImg[2].src;
        $('#product-img').ezPlus();
    }
    smallImg[3].onclick = function () {
        product.src = smallImg[3].src;
        $('#product-img').ezPlus();
    }

</script>
</body>
</html>
