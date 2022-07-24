<%if(manager != null){%>
<header class="head">
    <h1 class="logo"><img src="../immagini/logo/logo.png" width="300" height="90" alt=""></h1>
    <ul class="profile">
        <ul>
            <li><a href="#" class="">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="20" fill="currentColor"
                     class="bi bi-person-fill" viewBox="0 0 16 16">
                    <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                </svg>
                Ciao <%=manager.getNome()%>
            </a>
                <ul class="dropdown">
                    <li><a href="AddArticolo.jsp">Inserisci prodotto</a></li>
                    <li><a href="#">Visualizza ordini</a></li>
                    <li><a href="../visualizzautenti">Visualizza utenti</a></li>
                    <li><a href="../logout">Logout</a></li>
                </ul>
            </li>
        </ul>
    </ul>
</header>
<nav class="navbar-bar">
    <img src="" alt="">
    <ul class="menu">
        <ul>
            <li><a class="navigation-bar" href="#">Home</a></li>
            <li><a class="navigation-bar" href="#">Shop</a>
            <li><a class="navigation-bar" href="#">Componenti PC</a>
                <ul class="dropdown">
                    <li><a class="navigation-bar" href="#">RAM</a></li>
                    <li><a class="navigation-bar" href="#">CPU</a></li>
                    <li><a class="navigation-bar" href="#">GPU</a></li>

                </ul>
            </li>
            <li><a class="navigation-bar" href="#">Periferiche PC</a>
                <ul class="dropdown">
                    <li><a class="navigation-bar" href="#">SSD</a></li>
                    <li><a class="navigation-bar" href="#">HDD</a></li>
                </ul>
            </li>
            <li><a class="navigation-bar" href="#">Accessori</a>
                <ul class="dropdown">
                    <li><a class="navigation-bar" href="#">Tastiere</a></li>
                    <li><a class="navigation-bar" href="#">Mouse</a></li>
                </ul>
            </li>
            <li><a class="navigation-bar" href="#">PC Assemblati</a></li>
        </ul>
    </ul>
</nav>
<%}%>