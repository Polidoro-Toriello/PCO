package model.bean;

public class MetodoBean {
    private String nome, cognome, tipo, scadenza, email, numeroCarta;
    private int id, cvv;

    public MetodoBean() {
    }

    public MetodoBean(String numeroCarta, String nome, String cognome, String tipo, String scadenza, String email, int cvv) {
        this.nome = nome;
        this.cognome = cognome;
        this.tipo = tipo;
        this.scadenza = scadenza;
        this.email = email;
        this.numeroCarta = numeroCarta;
        this.cvv = cvv;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getScadenza() {
        return scadenza;
    }

    public void setScadenza(String scadenza) {
        this.scadenza = scadenza;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumeroCarta() {
        return numeroCarta;
    }

    public void setNumeroCarta(String numeroCarta) {
        this.numeroCarta = numeroCarta;
    }

    public int getCvv() {
        return cvv;
    }

    public void setCvv(int cvv) {
        this.cvv = cvv;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
