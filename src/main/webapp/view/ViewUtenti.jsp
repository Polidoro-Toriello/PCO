
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.bean.UserBean" %>
<%@ page import="java.util.Collection" %>
<% UserBean manager = (UserBean) session.getAttribute("manager");
    if(manager == null)
    {
        request.getSession().setAttribute("alertMsg","Errore!Accesso non consentito!");
        response.sendRedirect("./LoginPage.jsp");
    }
%>
<% Collection<UserBean> utenti = (Collection<UserBean>) session.getAttribute("utenti"); %>
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
<h1 class="text-center">Lista utenti</h1>
<div class="input-group">
    <div class="form-group">
        <label for="formutente">Cerca un utente:</label>
        <input onchange="searchuser()" placeholder="Cerca utente per email" type="search" id="formutente" class="form-control" />
    </div>
</div>
    <table class="table-responsive-sm" id="tabellautenti">
        <thead >
        <tr>
            <th>Profilo</th>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Email </th>
            <th >Username</th>
        </tr>
        </thead>
        <tbody>
        <% for(UserBean user:utenti){%>
        <tr>
            <td class="text-center">
                <img src="../immagini/iconaprofilo.png" class="image" alt="icona">
            </td>
            <td>
                <p><%=user.getNome()%></p>
            </td>
            <td>
                <p><%=user.getCognome()%></p>
            </td>
            <td>
                <p><%=user.getEmail()%></p>
            </td>
            <td>
                <p><%=user.getUsername()%></p>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <script src="${pageContext.request.contextPath}/js/appFunction.js"></script>
<%@include file="./fragment/footer.jsp" %>
</body>
</html>
