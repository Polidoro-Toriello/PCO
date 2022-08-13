<%@ page import="model.dao.MetodoPagamentoDao" %>
<%@ page import="java.util.Collection" %>
<%@ page import="model.dao.IndirizzoDao" %>
<%@ page import="model.bean.*" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@100;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../style.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        Checkout
    </title>
</head>
<%
    UserBean utente = (UserBean) session.getAttribute("utente");
    UserBean manager = null;
    Collection<MetodoBean> metodi = (Collection<MetodoBean>) session.getAttribute("metodiPagamento");
    Collection<IndirizzoBean> indirizzi = (Collection<IndirizzoBean>) session.getAttribute("indirizzi");
    Carrello carrello = (Carrello) session.getAttribute("carrello");
%>
<body>
<%@include file="./fragment/navbar.jsp" %>
<form method="get" action="../confirmAcquisto">
    <div class="riga">
        <div class="col-md-6">
            <div class="customer-info">
                <h2>Informazioni Utente</h2>
                <p>Nome: <%=utente.getNome()%>
                </p>
                <p>Cognome: <%=utente.getCognome()%>
                </p>
                <p>Username: <%=utente.getUsername()%>
                </p>
                <p>Email: <%=utente.getEmail()%>
                </p>
            </div>


            <div class="customer-pay">
                <h2>Metodo di Pagamento</h2>


                <p id="accept">Metodi Accettati</p>
                <i aria-hidden="true" class="fa fa-cc-mastercard"></i> <i aria-hidden="true"
                                                                          class="fa fa-cc-discover"></i>
                <i aria-hidden="true" class="fa fa-cc-visa"></i> <i aria-hidden="true" class="fa fa-cc-amex"></i>
                <%for (MetodoBean metodo : metodi) {%>
                <div class="form-group">
                    <input required type="radio"
                           name="idMetodo"
                           value="<%=metodo.getId()%>">&nbsp;&nbsp;<%=metodo.getNome() + " " + metodo.getCognome() + " - " + metodo.getTipo() + " " + metodo.getNumeroCarta().replace(" ", "").replaceAll("(?<!^..).(?=.{4})", "*")%>
                </div>
                <%}%>
            </div>


            <div class="customer-info">
                <h2>Indirizzo di spedizione</h2>
                <i aria-hidden="true" class="fa fa-cc-mastercard"></i> <i aria-hidden="true"
                                                                          class="fa fa-cc-discover"></i>
                <i aria-hidden="true" class="fa fa-cc-visa"></i> <i aria-hidden="true" class="fa fa-cc-amex"></i>
                <%for (IndirizzoBean indirizzo : indirizzi) {%>
                <div class="form-group">
                    <input required type="radio"
                           name="idIndirizzo"
                           value="<%=indirizzo.getCodice()%>">&nbsp;&nbsp;<%=indirizzo.getNome() + " " + indirizzo.getCognome() + ", " + indirizzo.getVia() + ", " + indirizzo.getCitta()%>
                </div>
                <%}%>
            </div>
        </div>


        <div class="col-md-6">
            <div class="customer-order">
                <h2>Riepilogo Ordine</h2>
                <br>
                <%for (ArticoloCarrello articolo : carrello.getArticoli()) {%>
                <p><span><%=articolo.getProduct().getNome().toUpperCase()%></span>
                </p>


                <p><%=articolo.getProduct().getPrezzo()%>&euro;&nbsp;x<%=articolo.getQta()%>
                </p>
                <br>
                <%}%>
                <hr>
                <p><b>TOTAL:</b><%=carrello.getTotale()%>&euro;        <input type="submit" class="acquista" value="Conferma"></p>
            </div>
        </div>
    </div>
</form>
<%@include file="./fragment/footer.jsp" %>
</body>
</html>