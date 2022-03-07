
<header class="head">
    <h1 class="logo"><img src="../images/logo/logo.png" width="110" height="90" alt=""></h1>
    <ul>
        <%if(utente == null && manager == null){%>
        <ul><li><a href="LoginPage.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
            <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/></svg>Login</a></li>
        <%}else{%>
            <ul><li><a href="../logout"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/> </svg>Logout</a>
        <%}%>
                <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
                    <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                </svg>Your Cart</a></li></ul>
</header>
<nav>
    <img src="" alt="">
    <ul class="menu">
        <ul>
            <li><a class="navigation-bar" href="#">Home</a></li>
            <li><a class="navigation-bar" href="#">Componenti</a>
                <ul class="dropdown">
                    <li><a class="navigation-bar" href="#">Tutti</a></li>
                    <li><a class="navigation-bar" href="#">PC</a></li>
                    <li><a class="navigation-bar" href="#">RAM</a></li>
                    <li><a class="navigation-bar" href="#">CPU</a></li>
                    <li><a class="navigation-bar" href="#">GPU</a></li>
                    <li><a class="navigation-bar" href="#">SSD</a></li>
                    <li><a class="navigation-bar" href="#">HDD</a></li>
                </ul>
            </li>
            <li><a class="navigation-bar" href="#">Accesori</a></li>
            <li><a class="navigation-bar" href="#">&nbsp;</a></li>
        </ul>
</nav>
