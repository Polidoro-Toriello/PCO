<header class="head">
    <h1 class="logo"><img src="../immagini/logo/logo.png" width="110" height="90" alt=""></h1>
    <ul class="profile">
        <ul>
            <%if (utente == null && manager == null) {%>
            <li><a href="LoginPage.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor"
                     class="bi bi-person-fill"
                     viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
                Login</a></li>
            <%} else {%>
            <li><a href="#" class="">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor"
                     class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
                Ciao <%=utente.getNome()%>
            </a>
                <ul class="dropdown">
                    <li><a href="#">Metodi di Pagamento</a></li>
                    <li><a href="#">Indirizzi di Spedizione</a></li>
                    <li><a href="../logout">Logout</a></li>
                </ul>
            </li>
            <%}%>
            <li><a href="Carrello.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor" class="bi bi-bag"
                     viewBox="0 0 16 16">
                    <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                </svg>
                Your Cart</a></li>
        </ul>
    </ul>

</header>
<nav class="navbar-bar">
    <img src="" alt="">
    <ul class="menu">
        <ul>
            <li><a class="navigation-bar" href="Home.jsp">Home</a></li>
            <li><a class="navigation-bar" href="../catalogoarticoli?categoria=tutti">Shop</a>
            <li><a class="navigation-bar" href="#">Componenti PC</a>
                <ul class="dropdown">
                    <li><a class="navigation-bar" href="../catalogoarticoli?categoria=RAM">RAM</a></li>
                    <li><a class="navigation-bar" href="../catalogoarticoli?categoria=CPU">CPU</a></li>
                    <li><a class="navigation-bar" href="../catalogoarticoli?categoria=GPU">GPU</a></li>

                </ul>
            </li>
            <li><a class="navigation-bar" href="#">Periferiche PC</a>
            <ul class="dropdown">
                <li><a class="navigation-bar" href="../catalogoarticoli?categoria=SSD">SSD</a></li>
                <li><a class="navigation-bar" href="../catalogoarticoli?categoria=HDD">HDD</a></li>
            </ul>
            </li>
            <li><a class="navigation-bar" href="#">Accessori</a>
            <ul class="dropdown">
                <li><a class="navigation-bar" href="../catalogoarticoli?categoria=tastiera">Tastiere</a></li>
                <li><a class="navigation-bar" href="../catalogoarticoli?categoria=mouse">Mouse</a></li>
            </ul>
            </li>
            <li><a class="navigation-bar" href="../catalogoarticoli?categoria=PC">PC Assemblati</a></li>
        </ul>
    </ul>
</nav>
