package model.bean;

import model.bean.ProdottoBean;

public class ProdottoCarrello {
    private ProdottoBean product;
    private int qta;
    public ProdottoCarrello(ProdottoBean product, int qta) {
        super();
        this.product = product;
        this.qta = qta;
    }
    public ProdottoBean getProduct() {
        return product;
    }
    public void setProduct(ProdottoBean product) {
        this.product = product;
    }
    public int getQta() {
        return qta;
    }
    public void setQta(int qta) {
        this.qta = qta;
    }

    @Override
    public String toString() {
        return "ProdottoCarrello [product=" + product + ", quantità=" + qta + "]";
    }


}

