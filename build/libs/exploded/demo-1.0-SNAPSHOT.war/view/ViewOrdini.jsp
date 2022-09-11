<%@ page import="model.bean.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.OrdineBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserBean manager = (UserBean) session.getAttribute("manager");
  if(manager == null)
  {
    request.getSession().setAttribute("alertMsg","Errore!Accesso non consentito!");
    response.sendRedirect("./LoginPage.jsp");
  }

%>
<% String message = (String) session.getAttribute("error"); %>
<% ArrayList<OrdineBean> ordini = (ArrayList<OrdineBean>) session.getAttribute("ordiniUtente");  %>
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
    <title>Visualizza ordini</title>
  </head>
  <body>
  <%@include file="./fragment/adminnavbar.jsp" %>
  <%if(ordini == null && message != null) {%>
  <div id="aggiunto" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      <p><%=message%></p>
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
  <%session.removeAttribute("error");%>
  <%}%>

  <div class="row">
    <div class="col-2 my-auto border border-primary">
      <div class="box-container">
        <h3>Cerca ordini:</h3>
        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
          <input type="radio" class="btn-check" name="btnradio" id="btnradio1" onclick="checkRadiobuttons()" autocomplete="off" checked>
          <label class="btn btn-outline-primary"  for="btnradio1">Per utente</label>

          <input type="radio" class="btn-check" onclick="checkRadiobuttons()" name="btnradio" id="btnradio2" autocomplete="off">
          <label class="btn btn-outline-primary" for="btnradio2">Per data</label>
        </div>

        <form id="formutente" method="GET" action="../cercaordiniutente">
          <div class="form-group mt-3">
            <label for="username">Inserisci username utente:</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Inserisci username">
          </div>

          <button type="submit" class="btn">Cerca</button>
        </form>

        <form id="formdata" method="GET" action="../cercaordinidata">
          <div class="form-group mt-3">
            <label for="fromdate">Dalla data:</label>
            <input type="date" class="form-control" id="fromdate"  name="fromdate">
          </div>

          <div class="form-group">
            <label for="todate">Alla data:</label>
            <input type="date" class="form-control" id="todate" name="todate">
          </div>

          <button type="submit" class="btn">Cerca</button>
        </form>

      </div>
    </div>
  </div>
<%if(ordini != null) {%>
  <div class="row mt-3">
    <div class="col-2 my-auto">
      <table class="table-responsive-sm" id="tabellautenti">
        <thead >
        <tr>
          <th>#Ordine</th>
          <th>Stato</th>
          <th>Totale</th>
          <th>Data</th>
          <th>Dettaglio</th>
        </tr>
        </thead>
        <tbody>
        <% for(OrdineBean bean:ordini){%>
        <tr>
          <td>
            <p><%=bean.getNumeroOrdine()%></p>
          </td>
          <td>
            <p><%=bean.getStato()%></p>
          </td>
          <td>
            <p><%=bean.getTotale()%></p>
          </td>
          <td>
            <p><%=bean.getData()%></p>
          </td>
          <td>
            <a class="link-detail" href="../dettaglioordineadmin?idordine=<%=bean.getNumeroOrdine()%>">Dettaglio</a>
          </td>
        </tr>
        <%}%>
        </tbody>
      </table>
    </div>
  </div>
  <%}%>
  <%@include file="./fragment/footer.jsp"%>
  <% session.removeAttribute("ordiniUtente"); %>
  </body>
<script src="../js/displayForm.js"></script>
</html>
