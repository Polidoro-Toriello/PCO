function validateregproduct(){
    var nomeregx = /^[A-Za-z0-9_!,.() ]+$/;
    var descrizioneregx = /^[A-Za-z0-9_!,.() ]+$/;
    const nome = document.getElementById("nome");
    const descrizione = document.getElementById("descrizione");
    document.getElementById("errorNome").innerHTML = ""
    document.getElementById("errorDescrizione").innerHTML = ""
    let check = true;
    if(!nomeregx.test(nome.value) || nome.value.toString().length>60){
        check = false;
        document.getElementById("errorNome").innerHTML = " <p class=\"text-danger\">Formato nome articolo non valido!</p>"
        nome.focus();
        nome.style.background = '#f08080';
    }
    if(!descrizioneregx.test(descrizione.value) || descrizione.value.toString().length>250){
        check = false;
        document.getElementById("errorDescrizione").innerHTML = " <p class=\"text-danger\">Formato descrizione articolo non valido!</p>"
        descrizione.focus();
        descrizione.style.background = '#f08080';
    }
    return check;
}