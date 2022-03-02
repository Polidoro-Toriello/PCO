package model.bean;

public class OrdineBean {

    private long numeroOrdine;
    private float totale;
    private String stato;
    private UserBean utente;

    public OrdineBean() {

    }

    public OrdineBean(float totale, String stato, UserBean utente) {
        this.totale = totale;
        this.stato = stato;
        this.utente = utente;
    }

    public long getNumeroOrdine() {
        return numeroOrdine;
    }

    public void setNumeroOrdine(long numeroOrdine) {
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

    public UserBean getUtente() {
        return utente;
    }

    public void setUtente(UserBean utente) {
        this.utente = utente;
    }

    @Override
    public String toString() {
        return "OrdineBean{" +
                "numeroOrdine=" + numeroOrdine +
                ", totale=" + totale +
                ", stato='" + stato + '\'' +
                ", utente=" + utente +
                '}';
    }
}
