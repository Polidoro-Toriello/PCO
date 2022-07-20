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
        document.getElementById("errorPwd").innerHTML = " <p class=\"text-danger\">La password deve contenere da 8 a 12 caratteri</p>"
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