<%--
  Created by IntelliJ IDEA.
  User: G.TORIELLO
  Date: 04/03/2022
  Time: 08:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String alert = (String) session.getAttribute("alertMsg");%>
<!DOCTYPE html>
<html lang="it">
<head>
    <title>Title</title>
    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Webestica.com">
    <meta name="description" content="Eduport- LMS, Education and Course Theme">
    <link rel="shortcut icon" href="../image/favicon.ico">

    <!-- Favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@100;500&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">

    <!-- Plugins CSS -->
    <link rel="stylesheet" type="text/css" href="../assets/vendor/font-awesome/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/tiny-slider/tiny-slider.css">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/glightbox/css/glightbox.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-7N7LGGGWT1"></script>
</head>
<body onload="setFocusLoginPage()">

<main role="main">
    <section class="p-0 d-flex align-items-center position-relative overflow-hidden">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-lg-6 d-md-flex align-items-center justify-content-center bg-info vh-lg-100">
                    <div class="p-3 p-lg-5">
                        <div class="text-center">
                            <h2 class="fw-bold text-light">Benvenuto in PCO</h2>
                        </div>
                        <a href="Home.jsp">
                            <img src="../immagini/logo/logo.png" class="mt-5 rounded-circle" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-12 col-lg-6 m-auto">
                    <%if (alert != null) {%>
                    <!-- Toast Alert Message -->
                    <div class="alert alert-primary d-flex align-items-center" role="alert">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                             class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2" viewBox="0 0 16 16" role="img"
                             aria-label="Warning:">
                            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                        </svg>
                        <div>
                            <%=alert%>
                        </div>
                        <%session.removeAttribute("alertMsg");%>
                    </div>
                    <!-- End Toast Alert Message -->
                    <% session.removeAttribute("alertMsg");
                    }%>
                    <div class="row my-5">
                        <div class="col-sm-10 col-xl-8 m-auto">
                            <h1 class="fs-2 text-info">Accedi su PCO</h1>
                            <form action="../login" method="get" accept-charset="utf-8" onsubmit="return validate();">
                                <div class="mb-4">
                                    <label for="Username" class="form-label">Username</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"/>
                                            </svg>
                                        </span>
                                        <input type="text" name="Username"
                                               class="form-control border-0 bg-light rounded-end ps-1"
                                               placeholder="Username" id="Username">
                                    </div>
                                </div>
                                <div class="mb-4">
                                    <label for="inputPassword5" class="form-label">Password</label>
                                    <div class="input-group input-group-lg">
                                        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"/>
</svg>
                                        </span>
                                        <input type="password" name="Password"
                                               class="form-control border-0 bg-light rounded-end ps-1"
                                               placeholder="Password" id="inputPassword5">
                                    </div>
                                </div>
                                <div class="align-items-center mt-0">
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-info mb-0" type="button">Login</button>
                                        <a style="text-align: center" href="RegisterPage.jsp">Non hai un account su PCO?
                                            Registrati!</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- Bootstrap JS -->
<script src="../assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="../assets/vendor/tiny-slider/tiny-slider.js"></script>
<script src="../assets/vendor/glightbox/js/glightbox.js"></script>
<script src="../assets/vendor/purecounterjs/dist/purecounter_vanilla.js"></script>

<!-- Template Functions -->
<script src="../assets/js/functions.js"></script>
<script src="../js/validazioneInput.js"></script>
<script src="../js/setFocus.js"></script>
</body>
</html>
