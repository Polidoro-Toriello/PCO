function ajaxFilter() {
    var xmlhttprequest = new XMLHttpRequest();
    var categoria =  document.getElementById("filterProdotto").value;
    console.log(categoria)
    xmlhttprequest.open("GET", "../catalogoarticoli?categoria=" +categoria+"&ajax=true", true);
    xmlhttprequest.onreadystatechange = function () {
        if (xmlhttprequest.status == 4 || xmlhttprequest.status == 200) {
            var responseText = this.responseText;
            switch (categoria){
                case "tutti":
                    document.getElementById("title").innerHTML="Tutto il nostro Catalogo";
                    break;
                case "RAM":
                    document.getElementById("title").innerHTML="Componenti PC/Memorie Ram";
                    break;
                case "CPU":
                    document.getElementById("title").innerHTML="Componenti PC/Processori";
                    break;
                case "GPU":
                    document.getElementById("title").innerHTML="Componenti PC/Schede Video";
                    break;
                case "HDD":
                    document.getElementById("title").innerHTML="Periferiche PC/Hard Disk";
                    break;
                case "SSD":
                    document.getElementById("title").innerHTML="Periferiche PC/SSD";
                    break;
                case "PC":
                    document.getElementById("title").innerHTML="PC da Gaming e Professionali";
                    break;
                case "tastiera":
                    document.getElementById("title").innerHTML="Accessori/Tastiere";
                    break;
                case "mouse":
                    document.getElementById("title").innerHTML="Accessori/Mouse";
                    break;
            }
            document.getElementById("shopping").innerHTML="";
            document.getElementById("shopping").innerHTML=responseText;

        }
    }
    xmlhttprequest.send();
}