package model.bean;

public class ComposizioneOrdine {
    private int id, quantita, prezzo, iva, idArticolo, idOrdine;
    private String nome, descrizione;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    public int getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(int prezzo) {
        this.prezzo = prezzo;
    }

    public int getIva() {
        return iva;
    }

    public void setIva(int iva) {
        this.iva = iva;
    }

    public int getIdArticolo() {
        return idArticolo;
    }

    public void setIdArticolo(int idArticolo) {
        this.idArticolo = idArticolo;
    }

    public int getIdOrdine() {
        return idOrdine;
    }

    public void setIdOrdine(int idOrdine) {
        this.idOrdine = idOrdine;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public ComposizioneOrdine() {
    }

    public ComposizioneOrdine(int id, int quantita, int prezzo, int iva, int idArticolo, int idOrdine, String nome, String descrizione) {
        this.id = id;
        this.quantita = quantita;
        this.prezzo = prezzo;
        this.iva = iva;
        this.idArticolo = idArticolo;
        this.idOrdine = idOrdine;
        this.nome = nome;
        this.descrizione = descrizione;
    }

    public ComposizioneOrdine(int quantita, int prezzo, int iva, int idArticolo, int idOrdine, String nome, String descrizione) {
        this.quantita = quantita;
        this.prezzo = prezzo;
        this.iva = iva;
        this.idArticolo = idArticolo;
        this.idOrdine = idOrdine;
        this.nome = nome;
        this.descrizione = descrizione;
    }
}
