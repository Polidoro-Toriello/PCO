<%@ page import="model.bean.*" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: nucle
  Date: 25/07/2022
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/appFunction.js"></script>
    <link rel="stylesheet" href="../invoice.css">
    <title>Ordine effettuato</title>
</head>
<body>
<% ArrayList<ArticoloCarrello> carrello = (ArrayList<ArticoloCarrello>) session.getAttribute("articoliOrdine");
    OrdineBean ordineBean = (OrdineBean) session.getAttribute("ordine");
    IndirizzoBean indirizzo = (IndirizzoBean) session.getAttribute("indirizzo");
    MetodoBean metodo = (MetodoBean) session.getAttribute("metodo");
    float totale = 0;
%>
<div class="container" id="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="invoice-title">
                <h2>Invoice</h2>
                <h3 class="pull-right">Ordine # <%=ordineBean.getNumeroOrdine()%>
                </h3>
            </div>
            <hr>
            <div class="row">
                <div class="col-xs-6">
                    <address>
                        <strong>Indirizzo di Spedizione:</strong><br>
                        <%=indirizzo.getNome() + " " + indirizzo.getCognome()%><br>
                        <%=indirizzo.getVia()%><br>
                        <%=indirizzo.getProvincia()%><br>
                        <%=indirizzo.getCitta() + ", " + indirizzo.getCap()%><br>
                        <%=indirizzo.getCellulare()%>
                    </address>
                </div>
                <div class="col-xs-6 text-right">
                </div>
            </div>
            <div class="row">
                <div class="col-xs-6">
                    <address>
                        <strong>Metodo di Pagamento:</strong><br>
                        <%=metodo.getTipo() + " " + metodo.getNumeroCarta().replace(" ", "").replaceAll("(?<!^..).(?=.{4})", "*")%>
                        <br>
                        <%=metodo.getEmail()%>
                    </address>
                </div>
                <div class="col-xs-6 text-right">
                    <address>
                        <strong>Data:</strong><br>
                        <%=ordineBean.getData()%><br><br>
                    </address>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Riepilogo Ordine</strong></h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-condensed">
                            <thead>
                            <tr>
                                <td><strong>Articolo</strong></td>
                                <td class="text-center"><strong>Prezzo</strong></td>
                                <td class="text-center"><strong>Quantita'</strong></td>
                                <td class="text-right"><strong>Totale</strong></td>
                            </tr>
                            </thead>
                            <tbody>
                            <% for (ArticoloCarrello articoloCarrello : carrello) {%>
                            <tr>
                                <td><%=articoloCarrello.getProduct().getNome()%>
                                </td>
                                <td class="text-center"><%=articoloCarrello.getProduct().getPrezzo()%>&euro;
                                </td>
                                <td class="text-center"><%=articoloCarrello.getQta()%>
                                </td>
                                <td class="text-right">
                                        <%=articoloCarrello.getProduct().getPrezzo() * articoloCarrello.getQta()%>&euro;
                                </td>
                                <%totale = totale + articoloCarrello.getQta() * articoloCarrello.getProduct().getPrezzo(); %>
                                    <%}%>
                            <tr>
                                <td class="no-line"></td>
                                <td class="no-line"></td>
                                <td class="no-line text-center"><strong>Totale</strong></td>
                                <td class="no-line text-right"><%=totale%> &euro;
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="submit" class="btnAdd" value="Scarica">
<script>
    $(document).click(function () {
        var today = new Date();
        var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        html2canvas(document.querySelector('.container')).then(canvas => {
            var imgData = canvas.toDataURL('image/png');
            var doc = new jspdf({
                allowTaint: true,
                backgroundColor: "rgb(54, 162, 235)",
                orientation: 'l', // landscape
                unit: 'pt', // points, pixels won't work properly
                format: [canvas.height, 2000] // set needed dimensions for any element
            });
            doc.addImage(imgData, 'PNG', 500, 0, canvas.width, canvas.height);
            doc.save('Data-' + date + '.pdf');
        });
    })
</script>
</body>
</html>
