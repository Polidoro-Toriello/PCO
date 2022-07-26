package model.dao;

import model.bean.IndirizzoBean;
import model.bean.UserBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class IndirizzoDao {


    public synchronized Collection<IndirizzoBean> doRetrieveAll() throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM indirizzo";
        Collection<IndirizzoBean> risultato = new ArrayList<>();

        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            ResultSet set = stmt.executeQuery();
            while (set.next()) {
                int id = set.getInt("codice");
                String utente = set.getString("utente");
                String nome = set.getString("nome");
                String cognome = set.getString("cognome");
                String cellulare = set.getString("cellulare");
                String provincia = set.getString("provincia");
                String citta = set.getString("citta");
                String cap = set.getString("cap");
                String via = set.getString("via");
                risultato.add(new IndirizzoBean(id, utente, nome, cognome, cellulare, provincia, citta, cap, via));
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


    public static synchronized Collection<IndirizzoBean> doRetrieveByUtente(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM indirizzo WHERE utente = ?";
        Collection<IndirizzoBean> risultato = new ArrayList<>();

        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet set = stmt.executeQuery();
            while (set.next()) {
                int id = set.getInt("codice");
                String utente = set.getString("utente");
                String nome = set.getString("nome");
                String cognome = set.getString("cognome");
                String cellulare = set.getString("cellulare");
                String provincia = set.getString("provincia");
                String citta = set.getString("citta");
                String cap = set.getString("cap");
                String via = set.getString("via");
                risultato.add(new IndirizzoBean(id, utente, nome, cognome, cellulare, provincia, citta, cap, via));
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


    public synchronized IndirizzoBean doRetrieveById(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM indirizzo WHERE codice = ?";
        IndirizzoBean risultato = new IndirizzoBean();
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet set = stmt.executeQuery();
            if (set.next()) {
                String utente = set.getString("utente");
                String nome = set.getString("nome");
                String cognome = set.getString("cognome");
                String cellulare = set.getString("cellulare");
                String provincia = set.getString("provincia");
                String citta = set.getString("citta");
                String cap = set.getString("cap");
                String via = set.getString("via");
                risultato = new IndirizzoBean(id, utente, nome, cognome, cellulare, provincia, citta, cap, via);
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


    public synchronized boolean doInsertIndirizzo(IndirizzoBean b) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "INSERT INTO indirizzo (utente,nome,cognome,cellulare,provincia,citta,cap,via) VALUES(?, ?, ?, ?, ?, ?, ?,?)";
        boolean check = false;
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, b.getUtente());
            stmt.setString(2, b.getNome());
            stmt.setString(3, b.getCognome());
            stmt.setString(4, b.getCellulare());
            stmt.setString(5, b.getProvincia());
            stmt.setString(6, b.getCitta());
            stmt.setString(7, b.getCap());
            stmt.setString(8, b.getVia());
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


    public synchronized boolean doDeleteIndirizzoByUtente(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "DELETE FROM indirizzo WHERE utente = ?";
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


    public synchronized boolean doDeleteIndirizzoById(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "DELETE FROM indirizzo WHERE codice = ?";
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


    public synchronized boolean doModifyIndirizzo(IndirizzoBean bean) throws SQLException
    {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stmt = null;
        String sql = "UPDATE indirizzo SET nome=?,cognome=?,cellulare=?,provincia=?,citta=?,cap=?,via=? WHERE codice=?";
        try{
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,bean.getNome());
            stmt.setString(2,bean.getCognome());
            stmt.setString(3, bean.getCellulare());
            stmt.setString(4, bean.getProvincia());
            stmt.setString(5, bean.getCitta());
            stmt.setString(6, bean.getCap());
            stmt.setString(7,bean.getVia());
            stmt.setInt(8,bean.getCodice());

            check = stmt.executeUpdate() == 1;
            conn.commit();
        }
        catch (SQLException e)
        {
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
