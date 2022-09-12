

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
            <li><a href="HomeAdmin.jsp">Home</a></li>
            <li><a class="navigation-bar" href="../catalogoarticoliadmin?categoria=tutti">Shop</a>
            <li class="services">
                <a href="#">Componenti PC</a>
                <!-- DROPDOWN MENU -->
                <ul class="dropdown">
                    <li><a class="navigation-bar" href="../catalogoarticoliadmin?categoria=RAM">RAM</a></li>
                    <li><a class="navigation-bar" href="../catalogoarticoliadmin?categoria=CPU">CPU</a></li>
                    <li><a class="navigation-bar" href="../catalogoarticoliadmin?categoria=GPU">GPU</a></li>
                </ul>
            </li>


            <li class="services">
                <a href="#">Periferiche PC</a>
                <!-- DROPDOWN MENU -->
                <ul class="dropdown">
                    <li><a class="navigation-bar" href="../catalogoarticoliadmin?categoria=SSD">SSD</a></li>
                    <li><a class="navigation-bar" href="../catalogoarticoliadmin?categoria=HDD">HDD</a></li>
                </ul>
            </li>

            <li><a class="navigation-bar" href="../catalogoarticoliadmin?categoria=PC">PC Assemblati</a></li>


            <%if (manager != null) {%>
            <li class="services"><a href="#" class="">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor"
                     class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
                Ciao <%=manager.getNome()%>
            </a>
                <ul class="dropdown">
                    <li><a href="AddArticolo.jsp">Inserisci prodotto</a></li>
                    <li><a href="ViewOrdini.jsp">Visualizza ordini</a></li>
                    <li><a href="../visualizzautenti">Visualizza utenti</a></li>
                    <li><a href="../logout">Logout</a></li>
                </ul>
                    <%}%>
        </div>
    </ul>
</nav>