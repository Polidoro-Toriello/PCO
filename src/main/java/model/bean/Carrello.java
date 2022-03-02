package model.bean;

import java.util.ArrayList;
import java.util.List;

public class Carrello {
    private List<ProdottoCarrello> prodotti;
    private float totale;

    public Carrello() {
        prodotti=new ArrayList<ProdottoCarrello>();
        totale=0;
    }

    public Carrello(List<ProdottoCarrello> prodotti, float totale) {
        this.prodotti = prodotti;
        this.totale = totale;
    }

    public List<ProdottoCarrello> getProdotti() {
        return prodotti;
    }

    public void setProdotti(List<ProdottoCarrello> prodotti) {
        this.prodotti = prodotti;
    }

    public float getTotale() {
        return totale;
    }

    public void setTotale(float totale) {
        this.totale = totale;
    }
}
