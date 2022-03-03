package model.dao;

import model.bean.UserBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import static other.Utils.generatePwd;

public class UserDao {


    public synchronized Collection<UserBean> doRetrieveAll() throws SQLException {

        Connection conn = null;
        Collection<UserBean> risultato = new ArrayList<>();
        String sql = "SELECT * FROM utente";
        PreparedStatement query = null;

        try {

            conn = ConnectionPool.conn();
            query = conn.prepareStatement(sql);
            ResultSet set = query.executeQuery();
            while (set.next()) {

                String email = set.getString("email");
                String nome = set.getString("nome");
                String cognome = set.getString("cognome");
                String username = set.getString("username");
                String password = set.getString("password");
                int admin = set.getInt("admin");
                boolean isadmin = admin == 0 ? false : true;

                UserBean user = new UserBean(nome, cognome, username, password, email, true, isadmin);
                risultato.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (query != null)
                query.close();
            if (conn != null)
                conn.close();
        }

        return risultato;
    }


    public synchronized UserBean doRetrieveByEmail(String email) throws SQLException {

        Connection conn = null;
        UserBean risultato = new UserBean();
        String sql = "SELECT * FROM utente WHERE email = ?";
        PreparedStatement query = null;

        try {

            conn = ConnectionPool.conn();
            query = conn.prepareStatement(sql);
            query.setString(1, email);
            ResultSet set = query.executeQuery();
            if (set.next()) {

                String nome = set.getString("nome");
                String cognome = set.getString("cognome");
                String username = set.getString("username");
                String password = set.getString("password");
                int admin = set.getInt("admin");
                boolean isadmin = admin == 0 ? false : true;

                risultato = new UserBean(nome, cognome, username, password, email, true, isadmin);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (query != null)
                query.close();
            if (conn != null)
                conn.close();
        }

        return risultato;


    }


    public synchronized boolean doDeleteUser(String email) throws SQLException {

        Connection conn = null;
        String sql = "DELETE FROM utente WHERE email = ?";
        PreparedStatement query = null;
        boolean check = false;

        try {
            conn = ConnectionPool.conn();
            query = conn.prepareStatement(sql);
            query.setString(1, email);
            check = query.executeUpdate() == 1;
            conn.commit();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (query != null)
                query.close();
            if (conn != null)
                conn.close();
        }

        return check;

    }


    public synchronized boolean doInsertUser(UserBean b) throws SQLException {
        Connection conn = null;
        String sql = "INSERT INTO utente (email,nome,cognome,username,password,admin) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement query = null;
        boolean check = false;
        String pwd = generatePwd(b.getPassword());
        try {
            conn = ConnectionPool.conn();
            query = conn.prepareStatement(sql);
            query.setString(1, b.getEmail());
            query.setString(2, b.getNome());
            query.setString(3, b.getCognome());
            query.setString(4, b.getUsername());
            query.setString(5, pwd);
            query.setInt(6, 0);
            check = query.executeUpdate() == 1;
            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (query != null)
                query.close();
            if (conn != null)
                conn.close();
        }
        return check;
    }

    public synchronized UserBean doRetrieveUtente(UserBean b) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        UserBean user = null;
        String query = "SELECT * FROM utente WHERE email = ? AND password = ?";
        PreparedStatement stmt = null;
        String pwd = generatePwd(b.getPassword());
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(query);
            stmt.setString(1, b.getEmail());
            stmt.setString(2, pwd);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new UserBean();
                user.setNome(rs.getString("nome"));
                user.setCognome(rs.getString("cognome"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                if (rs.getInt("admin") == 0) {
                    user.setAdmin(false);
                } else {
                    user.setAdmin(true);
                }
                stmt.close();
                conn.close();
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
        return user;
    }
}
