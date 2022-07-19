package model.dao;

import model.bean.ArticoloBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import static other.Utils.generatePwd;

public class ArticoloDao {
    public static Collection<ArticoloBean> doRetrieveAll() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        Collection<ArticoloBean> articoli = new ArrayList<ArticoloBean>();
        String query = "SELECT * FROM articolo";
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ArticoloBean articoloBean = new ArticoloBean();
                articoloBean.setIdArticolo(rs.getInt("idarticolo"));
                articoloBean.setNome(rs.getString("nome"));
                articoloBean.setCategoria(rs.getString("categoria"));
                articoloBean.setDescrizione(rs.getString("descrizione"));
                articoloBean.setQtaDisponibile(rs.getInt("qtadisponibile"));
                articoloBean.setPrezzo(rs.getFloat("prezzo"));
                articoloBean.setIva(rs.getInt("iva"));
                articoli.add(articoloBean);
                System.out.println(articoloBean);
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
        return articoli;
    }

    public static synchronized ArticoloBean doRetrieveById(int id) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        String query = "SELECT * FROM articolo where idarticolo = ?";
        ArticoloBean articoloBean = new ArticoloBean();
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                articoloBean.setIdArticolo(rs.getInt("idarticolo"));
                articoloBean.setNome(rs.getString("nome"));
                articoloBean.setCategoria(rs.getString("categoria"));
                articoloBean.setDescrizione(rs.getString("descrizione"));
                articoloBean.setQtaDisponibile(rs.getInt("qtadisponibile"));
                articoloBean.setPrezzo(rs.getFloat("prezzo"));
                articoloBean.setIva(rs.getInt("iva"));
            } else if (!rs.next()) {
                return null;
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
        return articoloBean;
    }

    public static Collection<ArticoloBean> doRetrieveCategoria(String categoria) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        Collection<ArticoloBean> articoli = new ArrayList<ArticoloBean>();
        String query = "SELECT * FROM articolo where categoria = ?";
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(query);
            stmt.setString(1, categoria);
            ResultSet rs = stmt.executeQuery();
            ArticoloBean articoloBean = new ArticoloBean();
            while (rs.next()) {
                articoloBean.setIdArticolo(rs.getInt("idarticolo"));
                articoloBean.setNome(rs.getString("nome"));
                articoloBean.setCategoria(rs.getString("categoria"));
                articoloBean.setDescrizione(rs.getString("descrizione"));
                articoloBean.setQtaDisponibile(rs.getInt("qtadisponibile"));
                articoloBean.setPrezzo(rs.getFloat("prezzo"));
                articoloBean.setIva(rs.getInt("iva"));
                articoli.add(articoloBean);
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
        return articoli;
    }

    public static boolean doInsertArticolo(ArticoloBean articolo) throws SQLException {
        Connection conn = null;
        String sql = "INSERT INTO articolo (`nome`, `descrizione`, `prezzo`, `iva`, `categoria`, `qtadisponibile`) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = null;
        boolean check = false;
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, articolo.getNome());
            stmt.setString(2, articolo.getDescrizione());
            stmt.setFloat(3, articolo.getPrezzo());
            stmt.setInt(4, articolo.getIva());
            stmt.setString(5, articolo.getCategoria());
            stmt.setInt(6, articolo.getQtaDisponibile());
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
    public static Collection<ArticoloBean> doRetrieveLastArrive() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        Collection<ArticoloBean> articoli = new ArrayList<ArticoloBean>();
        String query = "SELECT * FROM articolo order by idarticolo desc limit 9";
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ArticoloBean articoloBean = new ArticoloBean();
                articoloBean.setIdArticolo(rs.getInt("idarticolo"));
                articoloBean.setNome(rs.getString("nome"));
                articoloBean.setCategoria(rs.getString("categoria"));
                articoloBean.setDescrizione(rs.getString("descrizione"));
                articoloBean.setQtaDisponibile(rs.getInt("qtadisponibile"));
                articoloBean.setPrezzo(rs.getFloat("prezzo"));
                articoloBean.setIva(rs.getInt("iva"));
                articoli.add(articoloBean);
                System.out.println(articoloBean);
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
        return articoli;
    }
}
