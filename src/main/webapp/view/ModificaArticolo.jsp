
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.bean.UserBean" %>
<%@ page import="model.bean.ArticoloBean" %>
<%@ page import="model.dao.ArticoloDao" %>
<%@ page import="java.util.Collection" %>
<%String alert = (String) session.getAttribute("alertMsg");%>
<% UserBean manager = (UserBean) session.getAttribute("manager");
    if(manager == null)
    {
        request.getSession().setAttribute("alertMsg","Errore!Accesso non consentito!");
        response.sendRedirect("./LoginPage.jsp");
    }

%>
<%
    ArticoloDao dao =  new ArticoloDao();
    Collection<ArticoloBean> articoli = dao.doRetrieveLastArrive();
    ArticoloBean articolomod = (ArticoloBean) session.getAttribute("articolo");
%>
<html>
<head>
    <title>Modifica articolo</title>
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
<body onload="setFocusModificaArticoloPage()">
<%@include file="./fragment/adminnavbar.jsp" %>
<div class="small-container single-product" style="width: 100%">
    <div class="row">
        <div class="col-2">
            <img src="../immagini/<%=articolomod.getCategoria().toLowerCase()+"1"%>.jpg"  data-zoom-img="../immagini/<%=articolomod.getCategoria().toLowerCase()%>1.jpg" width="500px" height="500px" id="product-img">
            <div class="small-img-row">
                <% for (int i = 1; i <= 4; i++) {%>
                <div class="small-img-col">
                    <img src="../immagini/<%=articolomod.getCategoria().toLowerCase()+i%>.jpg" class="small-img">
                </div>
                <%}%>
            </div>
        </div>
        <div class="col-2">
            <%if(alert != null){%>
            <div id="aggiunto" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <p><%=alert%></p>
                </div>
            </div>
            <%}%>
            <h3>Modifica il prodotto</h3>
            <form action="../modificaarticolo" method="get" onsubmit="return validateregproduct()">
                <label for="nome">Nome prodotto:</label>
                <input class="mb-2" type="text" id="nome" name="Nome" placeholder="nome" value="<%=articolomod.getNome()%>" style="width: 200px;">
                <div id="errorNome">
                </div>
                <br>
                <label for="descrizione">Descrizione:</label>
                <div id="errorDescrizione">
                </div>
                <br>
                <textarea class="textarea mb-2" placeholder="descrizione" id="descrizione"  name="Descrizione" maxlength="2000"><%=articolomod.getDescrizione()%>"</textarea>
                <br>
                <label for="iva">IVA:</label>
                <input type="number" class="mb-2" name="IVA" id="iva" min="1" value="<%=articolomod.getIva()%>" style="width: 50px;">
                <br>
                <label for="prezzo">Prezzo:</label>
                <input type="number" id="prezzo" class="mb-2" name="Prezzo" min="1" value="<%=articolomod.getPrezzo()%>" step="0.01" style="width: 80px;">
                <br>
                <label for="categoria">Categoria:</label>
                <select name="Categoria"  onchange="changeimages()" class="selectinput mb-2" id="categoria">
                    <option  value="ram" <%if(articolomod.getCategoria().equalsIgnoreCase("ram")){%>selected<%}%>>RAM</option>
                    <option value="cpu" <%if(articolomod.getCategoria().equalsIgnoreCase("cpu")){%>selected<%}%>>CPU</option>
                    <option value="gpu" <%if(articolomod.getCategoria().equalsIgnoreCase("gpu")){%>selected<%}%>>GPU</option>
                    <option value="ssd" <%if(articolomod.getCategoria().equalsIgnoreCase("ssd")){%>selected<%}%>>SSD</option>
                    <option value="hdd" <%if(articolomod.getCategoria().equalsIgnoreCase("hdd")){%>selected<%}%>>HDD</option>
                    <option value="pc" <%if(articolomod.getCategoria().equalsIgnoreCase("pc")){%>selected<%}%>>PC</option>
                </select>
                <br>
                <label for="qta">Quantità disponibile:</label>
                <input type="number" class="mb-2" id="qta" name="Qta" value="<%=articolomod.getQtaDisponibile()%>" min="1" >
                <br>
                <button class="btn" type="submit">Modifica</button>
            </form>
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
                    <a class="btn"
                       href="../rimuovicatalogo?idArticolo=<%=articolo.getIdArticolo()%>">
                        Rimuovi Prodotto</a>
                    <a class="btn" href="../viewmodifica?idArticolo=<%=articolo.getIdArticolo()%>">Modifica</a>
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
                <p>Solo su PCO</p>
                <h1>Hp Pavillion Gaming 15</h1>
                <small>Hp Pavillion Gaming 15 è il miglior PC desktop in circolazione! RAM da 16GB fino a 3200Mhz di frequenza, SSD da
                    1TB, scheda grafica NVIDIA RTX 3080 e un processore Intel i9 12900K. Acquista ora, solo su PCO!</small>
                <br>
                <input type="submit" class="btn" value="Acquista">
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/igorlino/elevatezoom-plus@1.2.3/src/jquery.ez-plus.js"></script>
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
        <% request.getSession().removeAttribute("alertMsg"); %>

    <%@include file="./fragment/footer.jsp"%>
<script src="../js/changeimages.js"></script>
<script src="../js/setFocus.js"></script>
<script src="../js/checkAddedProduct.js"></script>
</body>
</html>