package control;

import model.bean.*;
import model.dao.ArticoloDao;
import model.dao.IndirizzoDao;
import model.dao.MetodoPagamentoDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserBean user = (UserBean) session.getAttribute("utente");
        if (user != null) {
            try {
                Collection<IndirizzoBean> indirizzi = IndirizzoDao.doRetrieveByUtente(user.getEmail());
                Collection<MetodoBean> metodi = MetodoPagamentoDao.doRetrieveAll(user.getEmail());
                if (indirizzi != null && metodi != null) {
                    session.setAttribute("indirizzi", indirizzi);
                    session.setAttribute("metodiPagamento", metodi);
                    resp.sendRedirect("view/CheckoutOrder.jsp");
                } else {
                    session.setAttribute("alertMsg", "Errore inaspetato");
                    resp.sendRedirect("view/Carrello.jsp");
                }
            } catch (SQLException | ClassNotFoundException e) {
                session.setAttribute("alertMsg", "Errore inaspettato");
                resp.sendRedirect("view/Carrello.jsp");
            }
        } else {
            session.setAttribute("alertMsg", "Accesso non effettuato");
            resp.sendRedirect("view/Home.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    }
}