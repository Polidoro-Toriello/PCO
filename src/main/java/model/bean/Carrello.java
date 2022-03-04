package model.bean;

import model.dao.ArticoloDao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class Carrello {
    private List<ArticoloCarrello> prodotti;
    private float totale;

    public Carrello() {
        prodotti = new ArrayList<ArticoloCarrello>();
        totale = 0;
    }

    public Carrello(List<ArticoloCarrello> prodotti, float totale) {
        this.prodotti = prodotti;
        this.totale = totale;
    }

    public boolean addArticolo(int id) throws SQLException, ClassNotFoundException {
        boolean result = false;
        ArticoloBean articolo = ArticoloDao.doRetrieveById(id);
        for (ArticoloCarrello articoloCarrello : prodotti) {
            if (articoloCarrello.getProduct().getCode() == articolo.getCode() && articoloCarrello.getQta() + 1 < articolo.getQtaDisponibile()) {
                articoloCarrello.setQta(articoloCarrello.getQta() + 1);
                this.updateTotale();
                result = true;
            }
        }
        return result;
    }

    public int isInCart(ArticoloBean articolo) {
        int nProdotti = 0;
        if (prodotti.isEmpty()) nProdotti = -1;
        for (int i = 0; i < prodotti.size(); i++) {
            if (prodotti.get(i).getProduct().getCode() == articolo.getCode()) {
                nProdotti = i;
            }
        }
        return nProdotti;
    }

    public boolean checkQuantity(int idProd, int quantita) throws SQLException, ClassNotFoundException {
        boolean result = false;
        ArticoloBean articolo = ArticoloDao.doRetrieveById(idProd);
        int pos = this.isInCart(articolo);
        int quantitaDesiderata = quantita;
        if (pos > 0) {
            quantitaDesiderata += prodotti.get(pos).getQta();
        }

        if (!(quantitaDesiderata > articolo.getQtaDisponibile())) {
            result = true;
        }
        return result;
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

    public void updateTotale() {
        float prezzo = 0;
        for (ArticoloCarrello articoloCarrello : prodotti) {
            prezzo += articoloCarrello.getProduct().getPrezzo() * articoloCarrello.getQta();
        }
        totale = prezzo;
    }

    public void setTotale(float x) {
        this.totale = x;
    }
}
