package control;

import model.bean.ArticoloBean;
import model.bean.Carrello;
import model.bean.OrdineBean;
import model.bean.UserBean;
import model.dao.ArticoloDao;
import model.dao.OrdineDao;
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
        UserBean userBean = (UserBean) session.getAttribute("manager");
        Carrello carrello = (Carrello) session.getAttribute("carrello");
        OrdineBean ordine = new OrdineBean();
        if (userBean != null && userBean.isValid()) {
            try {
                ordine.setTotale(carrello.getTotale());
                ordine.setStato("confermato");
                ordine.setUtente(userBean.getEmail());
                if (OrdineDao.doInsertOrdine(ordine)) {
                    session.setAttribute("alertMsg", "Ordine Completato");
                    resp.sendRedirect("view/OrdineEffettuato.jsp");
                }
                else{
                    session.setAttribute("alertMsg", "Ordine Fallito");
                    resp.sendRedirect("view/OrdineEffettuato.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                session.setAttribute("alertMsg", "Errore nell'inserimento dell'articolo");
                resp.sendRedirect("view/Carrello.jsp");
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