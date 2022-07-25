package model.dao;

import model.bean.OrdineBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

public class OrdineDao {

    public synchronized Collection<OrdineBean> doRetrieveALl() throws SQLException {

        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM ordine";
        Collection<OrdineBean> risultato = new ArrayList<>();
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            ResultSet set = stmt.executeQuery();
            while (set.next()) {
                int id = set.getInt("idordine");
                String stato = set.getString("stato");
                float totale = set.getFloat("totale");
                String email = set.getString("email");
                int idIndirizzo = set.getInt("idIndirizzo");
                int idMetodo = set.getInt("idMetodo");
                Date data = set.getDate("data");
                risultato.add(new OrdineBean(id, totale, stato, email, data, idIndirizzo, idMetodo));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }

        return risultato;
    }


    public synchronized OrdineBean doRetrieveById(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM ordine WHERE idordine = ?";
        OrdineBean risultato = new OrdineBean();
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet set = stmt.executeQuery();
            if (set.next()) {
                String stato = set.getString("stato");
                float totale = set.getFloat("totale");
                String email = set.getString("email");
                int idIndirizzo = set.getInt("idIndirizzo");
                int idMetodo = set.getInt("idMetodo");
                Date data = set.getDate("data");
                risultato = new OrdineBean(id, totale, stato, email, data, idIndirizzo, idMetodo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }

        return risultato;

    }


    public static synchronized Collection<OrdineBean> doRetrieveAllByUtente(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM ordine WHERE email = ?";
        Collection<OrdineBean> risultato = new ArrayList<>();
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet set = stmt.executeQuery();
            while (set.next()) {

                int id = set.getInt("idordine");
                String stato = set.getString("stato");
                float totale = set.getFloat("totale");
                int idIndirizzo = set.getInt("idIndirizzo");
                int idMetodo = set.getInt("idMetodo");
                Date data = set.getDate("data");
                risultato.add(new OrdineBean(id, totale, stato, email, data, idIndirizzo, idMetodo));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }

        return risultato;

    }


    public static synchronized int doInsertOrdine(OrdineBean b) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "INSERT INTO ordine (stato,totale,email,data,idIndirizzo,idMetodo) VALUES(?,?,?,?,?,?)";
        int check = 0;
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setString(1, b.getStato());
            stmt.setFloat(2, b.getTotale());
            stmt.setString(3, b.getUtente());
            stmt.setDate(4, new java.sql.Date(b.getData().getTime()));
            stmt.setInt(5, b.getIdIndirizzo());
            stmt.setInt(6, b.getIdMetodo());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                check = rs.getInt(1);
            }
            rs.close();
            conn.commit();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }

        return check;

    }


    public synchronized boolean doDeleteOrdineById(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "DELETE FROM ordine WHERE idordine = ?";
        boolean check = false;
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            check = stmt.executeUpdate() == 1;
            conn.commit();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }

        return check;
    }


    public synchronized boolean doDeleteOrdineByUtente(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "DELETE FROM ordine WHERE email = ?";
        boolean check = false;
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            check = stmt.executeUpdate() == 1;
            conn.commit();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }

        return check;
    }


}
