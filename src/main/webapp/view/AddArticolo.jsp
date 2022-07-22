
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.bean.UserBean" %>
<%String alert = (String) session.getAttribute("alertMsg");%>
<% UserBean manager = (UserBean) session.getAttribute("manager");
    if(manager == null)
    {
        request.getSession().setAttribute("alertMsg","Errore!Accesso non consentito!");
        response.sendRedirect("./LoginPage.jsp");
    }

%>
<html>
<head>
    <title>Inserimento articolo</title>
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
<%@include file="./fragment/adminnavbar.jsp" %>
<div class="small-container single-product" style="width: 100%">
    <div class="row">
        <div class="col-2">
            <img src="../immagini/gpu1.jpg" id="product-img">
            <div class="small-img-row">
                <% for (int i = 1; i <= 4; i++) {%>
                <div class="small-img-col">
                    <img src="../immagini/<%="gpu"+i%>.jpg" class="small-img">
                </div>
                <%}%>
            </div>
        </div>
        <div class="col-2">
            <%if(alert != null){%>
            <div id="aggiunto" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <p>Articolo aggiunto al catalogo</p>
                </div>
            </div>
            <%}%>
            <h3>Inserisci un nuovo prodotto</h3>
            <form action="../addArticolo" method="get">
                <label for="nome">Nome prodotto:</label>
                <input type="text" id="nome" name="Nome" placeholder="nome" style="width: 200px;">
                <br>
                <label for="descrizione">Descrizione:</label>
                <br>
                <textarea class="textarea" placeholder="descrizione" id="descrizione" name="Descrizione" maxlength="2000"></textarea>
                <br>
                <label for="iva">IVA:</label>
                <input type="number" name="IVA" id="iva" min="1" value="1" style="width: 50px;">
                <br>
                <label for="prezzo">Prezzo:</label>
                <input type="number" id="prezzo" name="Prezzo" min="1" value="1" step="0.01" style="width: 80px;">
                <br>
                <label for="categoria">Categoria:</label>
                <select name="Categoria" id="categoria">
                    <option value="ram">RAM</option>
                    <option value="cpu">CPU</option>
                    <option value="gpu">GPU</option>
                    <option value="ssd">SSD</option>
                    <option value="hdd">HDD</option>
                    <option value="pc">PC</option>
                </select>
                <br>
                <label for="qta">Quantità disponibile:</label>
                <input type="number" id="qta" name="Qta" value="1" min="1" >
                <br>
                <button class="btn" type="submit">Inserisci</button>
            </form>
        </div>
    </div>
</div>
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

</body>
<%@include file="./fragment/footer.jsp"%>
</html>
