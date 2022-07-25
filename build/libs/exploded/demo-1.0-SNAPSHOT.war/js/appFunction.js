import {jsPDF} from "jspdf";

function validateReg() {
    const pass_valid = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d[\]{};.:=<>_+^#$@!%*?&]{8,30}$/;
    const email_valid = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/;
    const nome_cognome_valid = /^[a-zA-Z\s]*$/;
    const nome = document.getElementById("Nome");
    const cognome = document.getElementById("Cognome");
    const email_form = document.getElementById("Email");
    const pass_form = document.getElementById("inputPassword5");
    let check = true;
    document.getElementById("errorNome").innerHTML = ""
    document.getElementById("errorCognome").innerHTML = ""
    document.getElementById("errorEmail").innerHTML = ""
    document.getElementById("errorPwd").innerHTML = ""
    if (!email_valid.test(email_form.value) || email_form.value === '') {
        check = false;
        document.getElementById("errorEmail").innerHTML = " <p class=\"text-danger\">Email non valida controlla che sia il tuo indirizzo</p>"
        email_form.focus();
        email_form.style.background = '#f08080';
    }
    if (!pass_valid.test(pass_form.value) || pass_form.value === '') {

        check = false;
        pass_form.focus();
        document.getElementById("errorPwd").innerHTML = " <p class=\"text-danger\">La password deve contenere da 8 a 12 caratteri, una lettera maiuscola e un simbolo</p>"
    }
    if (!nome_cognome_valid.test(nome.value)) {
        check = false;
        nome.focus();
        document.getElementById("errorNome").innerHTML = " <p class=\"text-danger\">Il campo del nome non può contenere numeri o simboli</p>"
    }
    if (!nome_cognome_valid.test(cognome.value)) {
        check = false;
        cognome.focus();
        document.getElementById("errorCognome").innerHTML = " <p class=\"text-danger\">Il campo del cognome non può contenere numeri o simboli</p>"
    }
    return check;
}

function ajaxFilter() {
    var xmlhttprequest = new XMLHttpRequest();
    var categoria = document.getElementById("filterProdotto").value;
    xmlhttprequest.open("GET", "../catalogoarticoli?categoria=" + categoria + "&ajax=true", true);
    xmlhttprequest.onreadystatechange = function () {
        if (xmlhttprequest.status == 4 || xmlhttprequest.status == 200) {
            var responseText = this.responseText;
            switch (categoria) {
                case "tutti":
                    document.getElementById("title").innerHTML = "Tutto il nostro Catalogo";
                    break;
                case "RAM":
                    document.getElementById("title").innerHTML = "Componenti PC/Memorie Ram";
                    break;
                case "CPU":
                    document.getElementById("title").innerHTML = "Componenti PC/Processori";
                    break;
                case "GPU":
                    document.getElementById("title").innerHTML = "Componenti PC/Schede Video";
                    break;
                case "HDD":
                    document.getElementById("title").innerHTML = "Periferiche PC/Hard Disk";
                    break;
                case "SSD":
                    document.getElementById("title").innerHTML = "Periferiche PC/SSD";
                    break;
                case "PC":
                    document.getElementById("title").innerHTML = "PC da Gaming e Professionali";
                    break;
                case "tastiera":
                    document.getElementById("title").innerHTML = "Accessori/Tastiere";
                    break;
                case "mouse":
                    document.getElementById("title").innerHTML = "Accessori/Mouse";
                    break;
            }
            document.getElementById("shopping").innerHTML = "";
            document.getElementById("shopping").innerHTML = responseText;

        }
    }
    xmlhttprequest.send();
}

function sezione(x) {
    var xmlhttprequest = new XMLHttpRequest();
    xmlhttprequest.open("GET", "../userServlet?selezione=" + x.toString(), true);
    xmlhttprequest.onreadystatechange = function () {
        if (xmlhttprequest.status == 4 || xmlhttprequest.status == 200) {
            document.getElementById("selezione").innerHTML = this.responseText;
            if (x > 1 & x < 4) {
                var acc = document.getElementsByClassName("accordion");
                var i;

                for (i = 0; i < acc.length; i++) {
                    acc[i].addEventListener("click", function () {
                        this.classList.toggle("attivo");
                        var panel = this.nextElementSibling;
                        if (panel.style.display === "block") {
                            panel.style.display = "none";
                        } else {
                            panel.style.display = "block";
                        }
                    });
                }
            }
        }
    }
    xmlhttprequest.send()
}

function searchProduct() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("cercaProdotto");
    filter = input.value.toUpperCase();
    table = document.getElementById("shopping");
    tr = table.getElementsByClassName("product-box");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("h2")[0];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

