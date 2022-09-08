<nav class="navbar">
    <!-- LOGO -->
    <div class="logo"><img src="../immagini/logo/logo.png"></div>
    <!-- NAVIGATION MENU -->
    <ul class="nav-links">
        <!-- USING CHECKBOX HACK -->
        <input type="checkbox" id="checkbox_toggle"/>
        <label for="checkbox_toggle" class="hamburger">&#9776;</label>
        <!-- NAVIGATION MENUS -->
        <div class="menu">
            <li><a href="Home.jsp">Home</a></li>
            <li><a class="navigation-bar" href="../catalogoarticoli?categoria=tutti">Shop</a>
            <li class="services">
                <a href="#">Componenti PC</a>
                <!-- DROPDOWN MENU -->
                <ul class="dropdown">
                    <li><a class="navigation-bar" href="../catalogoarticoli?categoria=RAM">RAM</a></li>
                    <li><a class="navigation-bar" href="../catalogoarticoli?categoria=CPU">CPU</a></li>
                    <li><a class="navigation-bar" href="../catalogoarticoli?categoria=GPU">GPU</a></li>
                </ul>
            </li>


            <li class="services">
                <a href="#">Periferiche PC</a>
                <!-- DROPDOWN MENU -->
                <ul class="dropdown">
                    <li><a class="navigation-bar" href="../catalogoarticoli?categoria=SSD">SSD</a></li>
                    <li><a class="navigation-bar" href="../catalogoarticoli?categoria=HDD">HDD</a></li>
                </ul>
            </li>

            <li><a class="navigation-bar" href="../catalogoarticoli?categoria=PC">PC Assemblati</a></li>


            <%if (utente == null && manager == null) {%>
            <li><a href="LoginPage.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor"
                     class="bi bi-person-fill"
                     viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
                Login</a></li>
            <%} else {%>
            <li class="services"><a href="UserPage.jsp" class="">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor"
                     class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
                Ciao <%=utente.getNome()%>
            </a>
                <ul class="dropdown">
                    <li><a href="../logout">Logout</a></li>
                </ul>
                    <%}%>
            <li><a href="Carrello.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor" class="bi bi-bag"
                     viewBox="0 0 16 16">
                    <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
                </svg>
                Carrello</a></li>
        </div>
    </ul>
</nav>