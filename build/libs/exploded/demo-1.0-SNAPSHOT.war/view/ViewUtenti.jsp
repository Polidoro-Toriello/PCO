
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
<%String alert = (String) session.getAttribute("alertMsg");
    if (alert != null) {%>
<div class="alert">
    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
    <%=alert%>
</div>
<%}session.removeAttribute("alertMsg");%>
<h1 class="text-center">Lista utenti</h1>
    <table class="table-responsive-sm">
        <thead >
        <tr>
            <th class="text-center">Profilo</th>
            <th class="text-center">Info utente</th>
        </tr>
        </thead>
        <tbody>
        <% for(UserBean user:utenti){%>
        <tr>
            <td class="text-center">
                <img src="../immagini/iconaprofilo.png" class="image" alt="icona">
            </td>
            <td colspan="2">
                <div class="small-container">
                    <div class="row">
                        <div>
                            <label>Nome:</label>
                            <p><%=user.getNome()%></p>
                            <br>
                            <label>Cognome:</label>
                            <p><%=user.getCognome()%></p>
                        </div>
                        <div>
                            <br>
                            <label>Email:</label>
                            <p><%=user.getEmail()%></p>
                            <br>
                            <label>Username:</label>
                            <p><%=user.getUsername()%></p>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <%}%>
        </tbody>
    </table>

<%@include file="./fragment/footer.jsp" %>
</body>
</html>
