package model.bean;

import java.util.Date;

public class OrdineBean {

    private int numeroOrdine;
    private float totale;
    private String stato;
    private String emailutente;
    private Date data;

    public OrdineBean() {

    }

    public OrdineBean(int numeroOrdine, float totale, String stato, String emailutente, Date data) {
        this.numeroOrdine = numeroOrdine;
        this.totale = totale;
        this.stato = stato;
        this.emailutente = emailutente;
        this.data = data;
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

    public Date getData() { return data; }

    public void setData(Date data) {  this.data = data; }

    @Override
    public String toString() {
        return "OrdineBean{" + "numeroOrdine=" + numeroOrdine + ", totale=" + totale + ", stato='" + stato + '\'' + ", utente=" + emailutente + '}';
    }
}
