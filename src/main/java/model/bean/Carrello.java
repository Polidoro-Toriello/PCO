package model.bean;

import java.util.ArrayList;
import java.util.List;

public class Carrello {
    private List<ArticoloCarrello> prodotti;
    private float totale;

    public Carrello() {
        prodotti=new ArrayList<ArticoloCarrello>();
        totale=0;
    }

    public Carrello(List<ArticoloCarrello> prodotti, float totale) {
        this.prodotti = prodotti;
        this.totale = totale;
    }

    public List<ArticoloCarrello> getProdotti() {
        return prodotti;
    }

    public void setProdotti(List<ArticoloCarrello> prodotti) {
        this.prodotti = prodotti;
    }

    public float getTotale() {
        return totale;
    }

    public void setTotale(float totale) {
        this.totale = totale;
    }
}
