package control;

import model.bean.IndirizzoBean;
import model.bean.UserBean;
import model.dao.IndirizzoDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/modificaindirizzo")
public class ModificaIndirizzoServlet extends HttpServlet {

    private IndirizzoDao dao =  new IndirizzoDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        UserBean utente = (UserBean) session.getAttribute("utente");
        IndirizzoBean bean = new IndirizzoBean();
        if(utente != null && !utente.isAdmin()) {
            bean.setCodice(Integer.parseInt(req.getParameter("Codice")));
            bean.setNome(req.getParameter("Nome"));
            bean.setCognome(req.getParameter("Cognome"));
            bean.setCellulare(req.getParameter("Cellulare"));
            bean.setProvincia(req.getParameter("Provincia"));
            bean.setCitta(req.getParameter("Citta"));
            bean.setCap(req.getParameter("Cap"));
            bean.setVia(req.getParameter("Via"));
            try {
                if (dao.doModifyIndirizzo(bean)) {
                    session.setAttribute("alertMsg", "Indirizzo modificato!");
                    resp.sendRedirect("view/UserPage.jsp");
                } else {
                    session.setAttribute("alertMsg", "Errore nella modifica");
                    resp.sendRedirect("view/UserPage.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            session.setAttribute("alertMsg", "Accesso non effettuato");
            resp.sendRedirect("view/Home.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
