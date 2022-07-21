function ajaxFilter() {
    var xmlhttprequest = new XMLHttpRequest();
    xmlhttprequest.open("GET", "../catalogoarticoli?categoria=" + document.getElementById("filterProdotto").value, true);
    xmlhttprequest.onreadystatechange = function () {
        if (xmlhttprequest.status == 4 || xmlhttprequest.status == 200) {
            var responseText = this.responseText;
            document.getElementById("shopping").innerHTML=responseText;

        }
    }
    xmlhttprequest.send("ajax=true");
}