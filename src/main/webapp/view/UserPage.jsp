<%@ page import="model.bean.UserBean" %><%--
  Created by IntelliJ IDEA.
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
<% String alert = (String) session.getAttribute("alertMsg");%>
<body>
<%@include file="./fragment/navbar.jsp" %>

<div class="container light-style flex-grow-1 container-p-y">
    <%if (alert != null) {%>
    <div class="alert">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <%=alert%>
    </div>
    <%
            session.removeAttribute("alertMsg");
        }
    %>
    <h4 class="font-weight-bold py-3 mb-4">
        Impostazioni Account
    </h4>
    <div class="card overflow-hidden">
        <div class="riga">
            <div class="col-md-3 pt-0">
                <div class="list-group list-group-flush account-settings-links">
                    <a onclick="sezione(1)" value="Profilo" class="list-group-item list-group-item-action active"
                       data-toggle="list" href="#account-general">Profilo</a>
                    <a onclick="sezione(2)" value="Indirizzi" class="list-group-item list-group-item-action"
                       data-toggle="list" href="#account-indirizzi">Indirizzi</a>
                    <a onclick="sezione(3)" value="Metodo" class="list-group-item list-group-item-action"
                       data-toggle="list" href="#account-metodo">Metodo di Pagamento</a>
                    <a onclick="sezione(4)" value="Ordine" class="list-group-item list-group-item-action"
                       data-toggle="list" href="#account-social-links">Ordine</a>
                    <a onclick="sezione(5)" value="Aggiungi Metodo" class="list-group-item list-group-item-action"
                       data-toggle="list" href="#account-addMetodo">Aggiungi Metodo di Pagamento</a>
                    <a onclick="sezione(6)" value="Aggiungi Metodo" class="list-group-item list-group-item-action"
                       data-toggle="list" href="#account-addMetodo">Aggiungi Indirizzo di Spedizione</a>
                    <script>
                        const linkSelect = document.querySelectorAll(".list-group-item list-group-item-action")
                        $("a").click(function () {
                            $("a").removeClass("active")
                            $(this).addClass("active");
                        })
                    </script>
                </div>
            </div>
            <div class="col-sm-4 col-2">
                <div class="tab-content" id="selezione">
                    <div class="tab-pane fade active show" id="account-general">
                        <div class="card-body">
                            <div class="form-group">
                                <label class="form-label">Username</label>
                                <p class="form-control mb-1"><%=utente.getUsername()%>
                                </p>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Nome</label>
                                <p class="form-control mb-1"><%=utente.getNome()%>
                                </p>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Cognome</label>
                                <p class="form-control mb-1"><%=utente.getCognome()%>
                                </p>
                            </div>
                            <div class="form-group">
                                <label class="form-label">Email</label>
                                <p class="form-control mb-1"><%=utente.getEmail()%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<jsp:include page="fragment/footer.jsp"></jsp:include>
</body>
</html>
