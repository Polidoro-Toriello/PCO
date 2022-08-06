<%@ page import="model.bean.UserBean" %>
<%@ page import="model.bean.ArticoloBean" %>
<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% session.setAttribute("paginaCorrente", "CatalogoAdmin.jsp");%>
<% UserBean manager = (UserBean) session.getAttribute("manager");
    if(manager == null)
    {
        request.getSession().setAttribute("alertMsg","Errore!Accesso non consentito!");
        response.sendRedirect("./LoginPage.jsp");
    }
%>
<% Collection<ArticoloBean> articoli = (Collection<ArticoloBean>) session.getAttribute("articoli");%>
<%

    String title = (String) session.getAttribute("title");
    if (articoli == null) {
        response.sendRedirect(request.getContextPath() + "/catalogoarticoliadmin?categoria=tutti");
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
    <title>Title</title>
</head>
<body>
<%@include file="./fragment/adminnavbar.jsp" %>
<section class="shop container">
    <h2 class="section-tit1e" id="title"><%=title%>
    </h2>
    <div class="filtro">
        <input type="text" onchange="searchProduct()" placeholder="Rtx 3090 Ti" id="cercaProdotto">
        <select onchange="ajaxFilterAdmin()" id="filterProdotto">
            <option>Seleziona Categoria</option>
            <option name="tutti" value="tutti">Tutti</option>
            <option name="RAM">RAM</option>
            <option name="GPU">GPU</option>
            <option name="CPU">CPU</option>
            <option name="HDD">HDD</option>
            <option name="SSD">SSD</option>
            <option name="PC">PC</option>
            <option name="tastiera" value="tastiera">Tastiera</option>
            <option name="mouse" value="mouse">Mouse</option>
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
                <a class="btn" href="../viewmodifica?idArticolo=<%=articolo.getIdArticolo()%>">Modifica</a>
                <a class="btn"
                   href="../rimuovicatalogo?idArticolo=<%=articolo.getIdArticolo()%>">
                    Rimuovi Prodotto</a>
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

