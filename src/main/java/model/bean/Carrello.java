package model.bean;

import model.dao.ArticoloDao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Carrello {
    private List<ArticoloCarrello> articoli;
    private float totale;

    public Carrello() {
        articoli = new ArrayList<ArticoloCarrello>();
        totale = 0;
    }

    public Carrello(List<ArticoloCarrello> articoli, float totale) {
        this.articoli = articoli;
        this.totale = totale;
    }

    public boolean addArticolo(int idProdotto) throws SQLException, ClassNotFoundException {
        boolean result = false;
        ArticoloBean articolo = ArticoloDao.doRetrieveById(idProdotto);
        for (ArticoloCarrello articoloCarrello : articoli) {
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
        if (articoli.isEmpty()) nProdotti = -1;
        for (int i = 0; i < articoli.size(); i++) {
            if (articoli.get(i).getProduct().getCode() == articolo.getCode()) {
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
            quantitaDesiderata += articoli.get(pos).getQta();
        }

        if (!(quantitaDesiderata > articolo.getQtaDisponibile())) {
            result = true;
        }
        return result;
    }

    public void deleteProdotto(int idProd) {
        for (ArticoloCarrello articoloCarrello : articoli) {
            if (articoloCarrello.getProduct().getCode() == idProd) {
                articoli.remove(articoloCarrello);
                this.updateTotale();
                break;
            }
        }
    }

    public List<ArticoloCarrello> getArticoli() {
        return articoli;
    }

    public void setArticoli(List<ArticoloCarrello> articoli) {
        this.articoli = articoli;
    }

    public float getTotale() {
        return totale;
    }

    public void updateTotale() {
        float prezzo = 0;
        for (ArticoloCarrello articoloCarrello : articoli) {
            prezzo += articoloCarrello.getProduct().getPrezzo() * articoloCarrello.getQta();
        }
        totale = prezzo;
    }

    public void setTotale(float x) {
        this.totale = x;
    }
}
