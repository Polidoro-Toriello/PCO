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
        PreparedStatement stmt = null;

        try {

            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            ResultSet set = stmt.executeQuery();
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
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }

        return risultato;
    }


    public synchronized UserBean doRetrieveByEmail(String email) throws SQLException {

        Connection conn = null;
        UserBean risultato = new UserBean();
        String sql = "SELECT * FROM utente WHERE email = ?";
        PreparedStatement stmt = null;

        try {

            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet set = stmt.executeQuery();
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
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        }

        return risultato;


    }


    public synchronized boolean doDeleteUser(String email) throws SQLException {

        Connection conn = null;
        String sql = "DELETE FROM utente WHERE email = ?";
        PreparedStatement stmt = null;
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


    public synchronized boolean doInsertUser(UserBean b) throws SQLException {
        Connection conn = null;
        String sql = "INSERT INTO utente (email,nome,cognome,username,password,admin) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = null;
        boolean check = false;
        String pwd = generatePwd(b.getPassword());
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, b.getEmail());
            stmt.setString(2, b.getNome());
            stmt.setString(3, b.getCognome());
            stmt.setString(4, b.getUsername());
            stmt.setString(5, pwd);
            stmt.setInt(6, 0);
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

    public synchronized UserBean doRetrieveUtente(UserBean b) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        UserBean user = null;
        String query = "SELECT * FROM utente WHERE username = ? AND password = ?";
        PreparedStatement stmt = null;
        String pwd = generatePwd(b.getPassword());
        try {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(query);
            stmt.setString(1, b.getUsername());
            stmt.setString(2, pwd);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new UserBean();
                user.setNome(rs.getString("nome"));
                user.setCognome(rs.getString("cognome"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setValid(true);
                if (rs.getInt("admin") == 0) {
                    user.setAdmin(false);
                } else {
                    user.setAdmin(true);
                }
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


    public synchronized Collection<UserBean> doRetrieveNormalUsers() throws SQLException
    {
        PreparedStatement stmt = null;
        Connection conn = null;
        String sql = "SELECT nome,cognome,email,username FROM utente WHERE admin = 0";
        Collection<UserBean> utenti = new ArrayList<>();
        try
        {
            conn = ConnectionPool.conn();
            stmt = conn.prepareStatement(sql);
            ResultSet result =  stmt.executeQuery();
            while(result.next())
            {
                String nome = result.getString("nome");
                String cognome = result.getString("cognome");
                String email = result.getString("email");
                String username = result.getString("username");
                utenti.add(new UserBean(nome,cognome,username,"",email,true,false));
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
        finally
        {
            if(stmt != null)
                stmt.close();
            if(conn != null)
                conn.close();
        }

        return utenti;
    }

}
