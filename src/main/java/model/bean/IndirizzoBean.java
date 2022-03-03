package model.bean;

public class IndirizzoBean {

    private int codice;
    private String utente;
    private String nome;
    private String cognome;
    private String cellulare;
    private String provincia;
    private String citta;
    private String cap;

    public IndirizzoBean() {
    }

    public IndirizzoBean(int codice, String utente, String nome, String cognome, String cellulare, String provincia, String citta, String cap) {
        this.codice = codice;
        this.utente = utente;
        this.nome = nome;
        this.cognome = cognome;
        this.cellulare = cellulare;
        this.provincia = provincia;
        this.citta = citta;
        this.cap = cap;
    }

    public int getCodice() {
        return codice;
    }

    public void setCodice(int codice) {
        this.codice = codice;
    }

    public String getUtente() {
        return utente;
    }

    public void setUtente(String utente) {
        this.utente = utente;
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

    public String getCellulare() {
        return cellulare;
    }

    public void setCellulare(String cellulare) {
        this.cellulare = cellulare;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getCitta() {
        return citta;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    @Override
    public String toString() {
        return "IndirizzoBean{" +
                "codice=" + codice +
                ", utente='" + utente + '\'' +
                ", nome='" + nome + '\'' +
                ", cognome='" + cognome + '\'' +
                ", cellulare='" + cellulare + '\'' +
                ", provincia='" + provincia + '\'' +
                ", citta='" + citta + '\'' +
                ", cap='" + cap + '\'' +
                '}';
    }
}
