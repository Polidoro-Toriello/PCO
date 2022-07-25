package model.dao;

import model.bean.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

public class ComposizioneDao {
    public static Collection<ComposizioneOrdine> doRetrieveAll() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        Collection<ComposizioneOrdine> composizioni = new ArrayList<>();
        String query = "SELECT * FROM composizione";
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ComposizioneOrdine composizioneOrdine = new ComposizioneOrdine();
                composizioneOrdine.setIdOrdine(rs.getInt("id"));
                composizioneOrdine.setQuantita(rs.getInt("quantita"));
                composizioneOrdine.setPrezzo(rs.getInt("prezzo"));
                composizioneOrdine.setIva(rs.getInt("iva"));
                composizioneOrdine.setIdArticolo(rs.getInt("idArticolo"));
                composizioneOrdine.setIdOrdine(rs.getInt("idOrdine"));
                composizioneOrdine.setNome(rs.getString("nome"));
                composizioneOrdine.setDescrizione("descrizione");
                composizioni.add(composizioneOrdine);
                System.out.println(composizioneOrdine);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }
        return composizioni;
    }

    public static Collection<ComposizioneOrdine> doRetrieveAllByUtente(UserBean bean) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        Collection<ComposizioneOrdine> composizioni = new ArrayList<>();
        String query = "SELECT * FROM Ordine o,Composizione c, Utente u where p.idordine=c.idordine and o.email = ?";
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(query);
            stmt.setString(1, bean.getEmail());
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ComposizioneOrdine composizioneOrdine = new ComposizioneOrdine();
                composizioneOrdine.setIdOrdine(rs.getInt("id"));
                composizioneOrdine.setQuantita(rs.getInt("quantita"));
                composizioneOrdine.setPrezzo(rs.getInt("prezzo"));
                composizioneOrdine.setIva(rs.getInt("iva"));
                composizioneOrdine.setIdArticolo(rs.getInt("idArticolo"));
                composizioneOrdine.setIdOrdine(rs.getInt("idOrdine"));
                composizioneOrdine.setNome(rs.getString("nome"));
                composizioneOrdine.setDescrizione("descrizione");
                composizioni.add(composizioneOrdine);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }
        return composizioni;
    }

    public boolean insertComposizioneOrdine(Carrello carrello, int id) {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stmt = null;
        for (ArticoloCarrello articolo : carrello.getArticoli()) {
            String sql = "INSERT INTO composizione (quantita ,nome,prezzo,descrizione,iva,idArticolo,idOrdine) VALUES (?,?,?,?,?,?,?)";

            try {
                conn = ConnectionPool.conn();
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, articolo.getQta());
                stmt.setString(2, articolo.getProduct().getNome());
                stmt.setFloat(3, articolo.getProduct().getPrezzo());
                stmt.setString(4, articolo.getProduct().getDescrizione());
                stmt.setInt(5, articolo.getProduct().getIva());
                stmt.setInt(6, articolo.getProduct().getIdArticolo());
                stmt.setInt(7, id);
                check = stmt.executeUpdate() == 1;
                conn.commit();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return check;
    }

}

