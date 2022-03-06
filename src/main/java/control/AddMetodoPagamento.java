package control;

import model.bean.IndirizzoBean;
import model.bean.UserBean;
import model.dao.IndirizzoDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddMetodoPagamento extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserBean utente = (UserBean) session.getAttribute("utente");
        if (utente != null && utente.isValid() && !utente.isAdmin()) {
            IndirizzoBean indirizzo = new IndirizzoBean();
            try {
                indirizzo.setUtente(utente.getEmail());
                indirizzo.setNome(req.getParameter("Nome"));
                indirizzo.setCognome(req.getParameter("Cognome"));
                indirizzo.setCellulare(req.getParameter("Cellulare"));
                indirizzo.setProvincia(req.getParameter("Provincia"));
                indirizzo.setCitta(req.getParameter("Citta"));
                indirizzo.setCap(req.getParameter("Cap"));
                if (IndirizzoDao.doInsertIndirizzo(indirizzo)) {
                    session.setAttribute("alertMsg", "Metodo di pagamento inserito con successo");
                    resp.sendRedirect("view/AddMetodoPagamento.jsp");
                }
            } catch (Exception e) {
                session.setAttribute("alertMsg", "Errore nell'inserimento del metodo di pagamento");
                resp.sendRedirect("view/Home.jsp");
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
