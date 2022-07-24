package control;


import model.bean.IndirizzoBean;
import model.bean.MetodoBean;
import model.bean.OrdineBean;
import model.bean.UserBean;
import model.dao.IndirizzoDao;
import model.dao.MetodoPagamentoDao;
import model.dao.OrdineDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collection;

@WebServlet("/userServlet")
public class UserPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        String selezione = req.getParameter("selezione");
        UserBean bean = (UserBean) session.getAttribute("utente");
        resp.setContentType("text/html");
        if (selezione != null && bean != null) {
            PrintWriter writer = resp.getWriter();
            try {
                writer.println(updateUserPage(selezione, bean));
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        } else {
            resp.sendRedirect("view/Home.jsp");
            req.setAttribute("alertMsg", "Errore inaspettato");
        }

    }

    public String updateUserPage(String selezione, UserBean bean) throws SQLException, ClassNotFoundException {
        String html = "";
        switch (selezione) {
            case "1":
                html = String.format("       <div class=\"tab-pane fade active show\" id=\"account-general\">\n" +
                        "                        <div class=\"card-body\">\n" +
                        "                            <div class=\"form-group\">\n" +
                        "                                <label class=\"form-label\">Username</label>\n" +
                        "                                <p class=\"form-control mb-1\">%s</p>\n" +
                        "                            </div>\n" +
                        "                            <div class=\"form-group\">\n" +
                        "                                <label class=\"form-label\">Nome</label>\n" +
                        "                                <p class=\"form-control mb-1\">%s</p>\n" +
                        "                            </div>\n" +
                        "                            <div class=\"form-group\">\n" +
                        "                                <label class=\"form-label\">Cognome</label>\n" +
                        "                                <p class=\"form-control mb-1\">%s</p>\n" +
                        "                            </div>\n" +
                        "                            <div class=\"form-group\">\n" +
                        "                                <label class=\"form-label\">Email</label>\n" +
                        "                                <p class=\"form-control mb-1\">%s</p>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </div>", bean.getUsername(), bean.getNome(), bean.getCognome(), bean.getEmail());
                break;
            case "2":
                Collection<IndirizzoBean> indirizzi = IndirizzoDao.doRetrieveByUtente(bean.getEmail());
                for (IndirizzoBean indirizzo : indirizzi) {
                    String nomeCognome = indirizzo.getNome() + " " + indirizzo.getCognome();
                    html += String.format(
                            "<button class=\"accordion\">%s, %s</button>" +
                                    "<div class=\"panel\">" +
                                    "<form action=\"../modificaindirizzo\" method=\"get\">" +
                                    "<div class=\"tab-pane fade active show\" id=\"account-indirizzi\">\n" +
                                    "<input type=\"hidden\" name=\"codice\" value=\"%s\">" +
                                    "                        <div class=\"card-body pb-2\">\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Nome</label>\n" +
                                    "                                <input type=\"text\" name=\"Nome\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Cognome</label>\n" +
                                    "                                <input type=\"text\" name=\"Cognome\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Via di Domicilio</label>\n" +
                                    "                                <input type=\"text\" name=\"Via\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Citta'</label>\n" +
                                    "                                <input type=\"text\" name=\"Citta\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Cap</label>\n" +
                                    "                                <input type=\"text\" name=\"Cap\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Provincia</label>\n" +
                                    "                                <input type=\"text\" name=\"Provincia\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Cellulare</label>\n" +
                                    "                                <input type=\"text\" name=\"Cellulare\" class=\"form-control\" value=\"%s\"></div>" +
                                    "</div>" + "<input type=\"submit\" class=\"modifica\" value=\"Salva Modifica\">" + "</form></div></div><div class=\"productPage-btn\"><a href=\"../rimuoviindirizzo?idIndirizzo=%s\" class=\"rimuovi\">Rimuovi</a></div>\n",
                            nomeCognome, indirizzo.getCitta(), indirizzo.getCodice(), indirizzo.getNome(), indirizzo.getCognome(), indirizzo.getVia(), indirizzo.getCitta(), indirizzo.getCap(), indirizzo.getProvincia(), indirizzo.getCellulare(), indirizzo.getCodice());
                }
                break;
            case "3":
                Collection<MetodoBean> metodi = MetodoPagamentoDao.doRetrieveAll(bean.getEmail());
                for (MetodoBean metodo : metodi) {
                    html += String.format(
                            "<button class=\"accordion\">%s %s</button>" +
                                    "<div class=\"panel\">" +
                                    "<form action=\"../modificametodo\" method=\"get\">" +
                                    "      <div class=\"tab-pane fade active show\" id=\"account-metodi\">\n" +
                                    "                        <div class=\"card-body pb-2\">\n" +
                                    "\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Nome</label>\n" +
                                    "                                <input type=\"text\" name=\"Nome\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Cognome</label>\n" +
                                    "                                <input type=\"text\" name=\"Cognome\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Numero sulla carta</label>\n" +
                                    "                                <input type=\"text\" name=\"Numerocarta\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Scadenza</label>\n" +
                                    "                                <input type=\"text\" name=\"Scadenza\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "<div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">CVV</label>\n" +
                                    "                                <input type=\"text\" name=\"Cvv\" class=\"form-control\" value=\"\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Tipo</label>\n" +
                                    "                                <input type=\"text\" name=\"Tipo\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>\n" +
                                    "                            <div class=\"form-group\">\n" +
                                    "                                <label class=\"form-label\">Email</label>\n" +
                                    "                                <input type=\"text\" name=\"email\" class=\"form-control\" value=\"%s\">\n" +
                                    "                            </div>" + "</div>\n<div class=\"productPage-btn\"><input type=\"submit\" class=\"modifica\" value=\"Salva Modifica\"></div></div>" +
                                    "                    </div></form>" + "</div>\n<div class=\"productPage-btn\"><a href=\"../rimuovimetodo?Numerocarta=%s\" class=\"rimuovi\" value=\"Rimuovi\">Rimuovi</a></div></div>" +
                                    "                    </div>" + "</div></div><br>\n", metodo.getTipo(), metodo.getNumeroCarta().replace(" ", "").replaceAll("(?<!^..).(?=.{4})", "*"), metodo.getNome() ,metodo.getCognome(), metodo.getNumeroCarta().replace(" ", "").replaceAll("(?<!^..).(?=.{4})", "*"), metodo.getScadenza(), metodo.getTipo(), metodo.getEmail(),metodo.getNumeroCarta());
                }
                break;
            case "4":
                Collection<OrdineBean> ordini = OrdineDao.doRetrieveAllByUtente(bean.getEmail());
                html = "<div id=\"table-wrapper\">\n" +
                        "                        <div id=\"table-scroll\">\n" +
                        "                            <table>\n" +
                        "                                <thead>\n" +
                        "                                <tr>\n" +
                        "                                <tr>\n" +
                        "                                    <td>#Ordine</td>\n" +
                        "                                    <td>Totale</td>\n" +
                        "                                    <td>Email</td>\n" +
                        "                                    <td>Stato</td>\n" +
                        "                                    <td>Data</td>\n" +
                        "                                </tr>\n" +
                        "                                </tr>\n" +
                        "                                </thead>\n";
                for (OrdineBean ordine : ordini) {
                    html += String.format("<tbody>\n" +
                            "                                <tr>\n" +
                            "                                    <td class=\"col-xs-3\">%s</td>\n" +
                            "                                    <td class=\"col-xs-3\">%s&euro;</td>\n" +
                            "                                    <td class=\"col-xs-6\">%s</td>\n" +
                            "                                    <td>%s</td>\n" +
                            "                                    <td>%s</td>\n" +
                            "                                </tr>\n" +
                            "                                </tbody>\n" +
                            "                            </table>\n" +
                            "                        </div>\n" +
                            "                    </div>", ordine.getNumeroOrdine(), String.valueOf(ordine.getTotale()), ordine.getUtente(), ordine.getStato(), "" + ordine.getData());
                }
        }
        return html;
    }
}
