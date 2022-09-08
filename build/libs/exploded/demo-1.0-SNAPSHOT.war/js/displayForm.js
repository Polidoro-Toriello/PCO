function checkRadiobuttons() {
    let form_data = document.getElementById("formdata")
    let form_utente = document.getElementById("formutente")
    if(document.getElementById("btnradio1").checked){
        form_utente.style.display = "block"
        form_data.style.display = "none"
    }
    if(document.getElementById("btnradio2").checked) {
        form_utente.style.display = "none"
        form_data.style.display = "block"
    }
}

