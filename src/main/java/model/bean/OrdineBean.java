package model.bean;

import java.util.Date;

public class OrdineBean {

    private int numeroOrdine;
    private int idIndirizzo;

    public int getIdIndirizzo() {
        return idIndirizzo;
    }

    public void setIdIndirizzo(int idIndirizzo) {
        this.idIndirizzo = idIndirizzo;
    }

    public int getIdMetodo() {
        return idMetodo;
    }

    public void setIdMetodo(int idMetodo) {
        this.idMetodo = idMetodo;
    }

    public String getEmailutente() {
        return emailutente;
    }

    public void setEmailutente(String emailutente) {
        this.emailutente = emailutente;
    }

    private int idMetodo;
    private float totale;
    private String stato;
    private String emailutente;
    private Date data;


    public OrdineBean() {
        data = new Date();
    }

    public OrdineBean(int numeroOrdine, float totale, String stato, String emailutente, Date data, int idIndirizzo, int idMetodo) {
        this.numeroOrdine = numeroOrdine;
        this.totale = totale;
        this.idMetodo = idMetodo;
        this.idIndirizzo = idIndirizzo;
        this.stato = stato;
        this.emailutente = emailutente;
        this.data = data;
    }

    public OrdineBean(int numeroOrdine, String stato, float totale, Date data) {
        this.numeroOrdine = numeroOrdine;
        this.stato = stato;
        this.totale = totale;
        this.data = data;
    }


    public OrdineBean(float totale, String stato, String emailutente, int idIndirizzo, int idMetodo) {
        this.totale = totale;
        this.stato = stato;
        this.idMetodo = idMetodo;
        this.idIndirizzo = idIndirizzo;
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

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "OrdineBean{" + "numeroOrdine=" + numeroOrdine + ", totale=" + totale + ", stato='" + stato + '\'' + ", utente=" + emailutente + '}';
    }
}
