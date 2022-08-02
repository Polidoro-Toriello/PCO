package control;

import model.bean.UserBean;
import model.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/ricercautente")
public class RicercaUtenteServlet extends HttpServlet {

    private UserDao dao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String utente = req.getParameter("utente");
        UserBean userbean = null;
        try {
            userbean = dao.doRetrieveByEmail(utente);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        if(userbean == null) {
            try {
                writer.println(updatetabella(1,utente));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                writer.println(updatetabella(2,utente));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    public String updatetabella(int num,String emailutente) throws SQLException {
        ArrayList<UserBean> utenti = new ArrayList<>();
        UserBean user = new UserBean();
        String html = " <thead >\n" +
                "        <tr>\n" +
                "            <th>Profilo</th>\n" +
                "            <th>Nome</th>\n" +
                "            <th>Cognome</th>\n" +
                "            <th>Email </th>\n" +
                "            <th >Username</th>\n" +
                "        </tr>\n" +
                "        </thead>\n";
        html += "<tbody>\n";
        switch(num) {

            case 1:
                utenti = (ArrayList<UserBean>) dao.doRetrieveNormalUsers();
                for(UserBean utente:utenti)
                    html += String.format("<tr>\n" +
                            "            <td class=\"text-center\">\n" +
                            "                <img src=\"../immagini/iconaprofilo.png\" class=\"image\" alt=\"icona\">\n" +
                            "            </td>\n" +
                            "            <td>\n" +
                            "                <p>%s</p>\n" +
                            "            </td>\n" +
                            "            <td>\n" +
                            "                <p>%s</p>\n" +
                            "            </td>\n" +
                            "            <td>\n" +
                            "                <p>%s</p>\n" +
                            "            </td>\n" +
                            "            <td>\n" +
                            "                <p>%s</p>\n" +
                            "            </td>\n" +
                            "        </tr>",utente.getNome(),utente.getCognome(),utente.getEmail(),utente.getUsername());
                html += " </tbody>\n";
                break;

            case 2:
                user = dao.doRetrieveByEmail(emailutente);
                html += String.format("<tr>\n" +
                        "            <td class=\"text-center\">\n" +
                        "                <img src=\"../immagini/iconaprofilo.png\" class=\"image\" alt=\"icona\">\n" +
                        "            </td>\n" +
                        "            <td>\n" +
                        "                <p>%s</p>\n" +
                        "            </td>\n" +
                        "            <td>\n" +
                        "                <p>%s</p>\n" +
                        "            </td>\n" +
                        "            <td>\n" +
                        "                <p>%s</p>\n" +
                        "            </td>\n" +
                        "            <td>\n" +
                        "                <p>%s</p>\n" +
                        "            </td>\n" +
                        "        </tr>",user.getNome(),user.getCognome(),emailutente,user.getUsername());
                html += " </tbody>\n";
                break;
        }

        return html;
    }

}
