package control;

import model.bean.*;
import model.dao.*;
import other.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@WebServlet("/confirmAcquisto")
public class ConfirmAcquisto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        IndirizzoDao indirizzoDao = new IndirizzoDao();
        ComposizioneDao composizioneDao = new ComposizioneDao();
        OrdineDao ordineDao = new OrdineDao();
        MetodoPagamentoDao metodoPagamentoDao = new MetodoPagamentoDao();
        UserBean userBean = (UserBean) session.getAttribute("utente");
        Carrello carrello = (Carrello) session.getAttribute("carrello");
        OrdineBean ordine = new OrdineBean();
        if (userBean != null && userBean.isValid()) {
            try {
                ordine.setTotale(carrello.getTotale());
                ordine.setStato("confermato");
                ordine.setIdIndirizzo(Integer.parseInt(req.getParameter("idIndirizzo")));
                ordine.setIdMetodo(Integer.parseInt(req.getParameter("idMetodo")));
                ordine.setUtente(userBean.getEmail());
                int idOrdine = OrdineDao.doInsertOrdine(ordine);
                if (idOrdine > 0) {
                    if (composizioneDao.insertComposizioneOrdine(carrello, idOrdine)) {
                        session.setAttribute("alertMsg", "Ordine Completato");
                        session.setAttribute("indirizzo", indirizzoDao.doRetrieveById(ordine.getIdIndirizzo()));
                        session.setAttribute("ordine", ordineDao.doRetrieveById(idOrdine));
                        session.setAttribute("metodo", metodoPagamentoDao.doRetrieveById(Integer.parseInt(req.getParameter("idMetodo"))));
                        resp.sendRedirect("view/OrdineEffettuato.jsp");
                    }
                } else {
                    session.setAttribute("alertMsg", "Ordine Fallito");
                    resp.sendRedirect("view/OrdineEffettuato.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                session.setAttribute("alertMsg", "Errore nell'inserimento dell'articolo");
                resp.sendRedirect("view/Carrello.jsp");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
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