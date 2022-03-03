package model.bean;

public class OrdineBean {

    private int numeroOrdine;
    private float totale;
    private String stato;
    private String emailutente;

    public OrdineBean() {

    }

    public OrdineBean(float totale, String stato, String emailutente) {
        this.totale = totale;
        this.stato = stato;
        this.emailutente = emailutente;
    }

    public int getNumeroOrdine() {
        return numeroOrdine;
    }

    public void setNumeroOrdine(int numeroOrdine) {
        this.numeroOrdine = numeroOrdine;
    }

    public float getTotale() {
        return totale;
    }

    public void setTotale(float totale) {
        this.totale = totale;
    }

    public String getStato() {
        return stato;
    }

    public void setStato(String stato) {
        this.stato = stato;
    }

    public String getUtente() {
        return emailutente;
    }

    public void setUtente(String utente) {
        this.emailutente = utente;
    }

    @Override
    public String toString() {
        return "OrdineBean{" +
                "numeroOrdine=" + numeroOrdine +
                ", totale=" + totale +
                ", stato='" + stato + '\'' +
                ", utente=" + emailutente+
                '}';
    }
}
