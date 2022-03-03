package model.bean;

public class ArticoloCarrello {
    private ArticoloBean product;
    private int qta;
    public ArticoloCarrello(ArticoloBean product, int qta) {
        super();
        this.product = product;
        this.qta = qta;
    }
    public ArticoloBean getProduct() {
        return product;
    }
    public void setProduct(ArticoloBean product) {
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

