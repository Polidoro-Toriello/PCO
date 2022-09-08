<%@ page import="model.bean.UserBean" %>
<%@ page import="model.bean.ArticoloBean" %>
<%@ page import="java.util.Collection" %><%--
  Created by IntelliJ IDEA.
  User: nucle
  Date: 20/07/2022
  Time: 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserBean utente = (UserBean) session.getAttribute("utente"); %>
<% session.setAttribute("paginaCorrente", "Catalogo.jsp");%>
<% UserBean manager = (UserBean) session.getAttribute("manager");%>
<% Collection<ArticoloBean> articoli = (Collection<ArticoloBean>) session.getAttribute("articoli");%>
<%

    String title = (String) session.getAttribute("title");
    String alert = (String) session.getAttribute("alertMsg");
    if (articoli == null) {
        response.sendRedirect(request.getContextPath() + "/catalogoarticoli?categoria=tutti");
        return;
    }%>
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
    <title>Catalogo</title>
</head>
<body>
<%@include file="./fragment/navbar.jsp" %>
<%
    if (alert != null && alert.equals("true")) {
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
    session.removeAttribute("alertMsg");
}%>
<%if (alert != null && !alert.equals("true")) {%>
<div class="alert">
    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
    <%=alert%>
</div>
<%
        session.removeAttribute("alertMsg");
    }
%>
<section class="shop container">
    <h2 class="section-tit1e" id="title"><%=title%>
    </h2>
    <div class="filtro">
        <input type="text" onchange="searchProduct()" placeholder="Rtx 3090 Ti" id="cercaProdotto">
        <select onchange="ajaxFilter()" id="filterProdotto">
            <option>Seleziona Categoria</option>
            <option name="tutti" value="tutti">Tutti</option>
            <option name="RAM">RAM</option>
            <option name="GPU">GPU</option>
            <option name="CPU">CPU</option>
            <option name="HDD">HDD</option>
            <option name="SSD">SSD</option>
            <option name="PC">PC</option>
        </select>
    </div>
    <div class="wrapper">
        <div class="shop-content" id="shopping">
            <%for (ArticoloBean articolo : articoli) {%>
            <div class="product-box">
                <%if (articolo.getCategoria().equalsIgnoreCase("gpu")) {%>
                    <img src="<%="../immagini/gpu1.jpg"%>" alt="gpu" class="product-img">
                <%}%>
                <%if (articolo.getCategoria().equalsIgnoreCase("pc")) {%>
                    <img src="<%="../immagini/pc1.jpg"%>" alt="pc" class="product-img">
                <%}%>
                <%if (articolo.getCategoria().equalsIgnoreCase("cpu")) {%>
                    <img src="<%="../immagini/cpu1.jpg"%>" alt="cpu" class="product-img">
                <%}%>
                <%if (articolo.getCategoria().equalsIgnoreCase("ram")) {%>
                    <img src="<%="../immagini/ram1.jpg"%>" alt="ram" class="product-img">
                <%}%>
                <%if (articolo.getCategoria().equalsIgnoreCase("ssd")) {%>
                    <img src="<%="../immagini/ssd1.jpg"%>" alt="ssd" class="product-img">
                <%}%>
                <%if (articolo.getCategoria().equalsIgnoreCase("hdd")) {%>
                    <img src="<%="../immagini/hdd1.jpg"%>" alt="hdd" class="product-img">
                <%}%>
                <h2 class="product-title"><%=articolo.getNome().toUpperCase()%> &nbsp;
                    &nbsp;Prezzo:&nbsp;<%=articolo.getPrezzo()%>&euro;</h2>
                <a class="btn" href="../articolo?idArticolo=<%=articolo.getIdArticolo()%>">Vai al Prodotto</a>
                <a class="btn" id="aggiungiCarrello"
                   href="../aggiungicarrello?idArticolo=<%=articolo.getIdArticolo()%>&qta=1">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor"
                         class="bi bi-bag" viewBox="0 0 16 16">
                        <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                    </svg>
                    Aggiungi al Carrello</a>
            </div>
            <%}%>
        </div>
    </div>
</section>
</div>
<%@include file="./fragment/footer.jsp" %>
<script src="${pageContext.request.contextPath}/js/appFunction.js"></script>
</body>
</html>
