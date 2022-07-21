<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.bean.UserBean" %>
<%@ page import="java.util.Collection" %>
<%@ page import="model.bean.ArticoloBean" %>
<%@ page import="model.dao.ArticoloDao" %>

<% UserBean manager = (UserBean) session.getAttribute("manager");
if(manager == null)
{
    request.getSession().setAttribute("alertMsg","Errore!Accesso non consentito!");
    response.sendRedirect("./LoginPage.jsp");
}

%>


<%
    Collection<ArticoloBean> articoli = (Collection<ArticoloBean>) ArticoloDao.doRetrieveAll();
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

<%@include file="./fragment/adminnavbar.jsp" %>
<div class="hero">
    <div class="hero_content">
        <div class="row">
            <div class="col-2">
                <h1>Benvenuti su PCO</h1>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto rerum eos iste aliquam, aliquid
                    odio quae?</p>
            </div>
            <div class="col-2">
                <img src="../immagini/top_img.png">
            </div>
        </div>
    </div>
</div>
<div class="small-container">
    <div class="categories">
        <div class="row">
            <div class="col-3">
                <img src="../immagini/GPU.jpg">
            </div>
            <div class="col-3">
                <img src="../immagini/Intel.jpg">
            </div>
            <div class="col-3">
                <img src="../immagini/PC.jpg">
            </div>
        </div>
    </div>
</div>
<section class="articoliHome" id="articoliHome">

    <h2 class="title">Ultimi Arrivi</h2>

    <div class="box-container">
        <%for (ArticoloBean articolo : articoli) {%>
        <div class="box">
            <%if(articolo.getCategoria().equalsIgnoreCase("gpu")){%>
            <div class="image">
                <img src="<%="../immagini/gpu1.jpg"%>" alt="gpu">
            </div>
            <%}%>
            <%if(articolo.getCategoria().equalsIgnoreCase("pc")){%>
            <div class="image">
                <img src="<%="../immagini/pc1.jpg"%>" alt="pc">
            </div>
            <%}%>
            <%if(articolo.getCategoria().equalsIgnoreCase("cpu")){%>
            <div class="image">
                <img src="<%="../immagini/cpu1.jpg"%>" alt="cpu">
            </div>
            <%}%>
            <%if(articolo.getCategoria().equalsIgnoreCase("ram")){%>
            <div class="image">
                <img src="<%="../immagini/ram1.jpg"%>" alt="ram">
            </div>
            <%}%>
            <%if(articolo.getCategoria().equalsIgnoreCase("ssd")){%>
            <div class="image">
                <img src="<%="../immagini/ssd1.jpg"%>" alt="ssd">
            </div>
            <%}%>
            <%if(articolo.getCategoria().equalsIgnoreCase("hdd")){%>
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
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
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
                <small>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Doloremque nostrum perspiciatis neque
                    velit beatae maiores saepe ex quia rerum voluptate nihil, quisquam dolor minus voluptatibus,
                    molestiae quis necessitatibus vero.</small>
                <input type="submit" class="btn" value="Acquista">
            </div>
        </div>
    </div>
</div>
<%@include file="fragment/footer.jsp" %>
</body>
</html>
