package control;

import model.bean.MetodoBean;
import model.bean.UserBean;
import model.dao.MetodoPagamentoDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/modificametodo")
public class ModificaMetodoPagamentoServlet extends HttpServlet {

    private MetodoPagamentoDao dao = new MetodoPagamentoDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserBean utente = (UserBean) session.getAttribute("utente");
        MetodoBean bean = new MetodoBean();
        if(utente != null && !utente.isAdmin()) {
            bean.setNumeroCarta(req.getParameter("Numerocarta"));
            bean.setTipo(req.getParameter("Tipo"));
            bean.setScadenza(req.getParameter("Scadenza"));
            bean.setCvv(Integer.parseInt(req.getParameter("Cvv")));
            bean.setNome(req.getParameter("Nome"));
            bean.setCognome(req.getParameter("Cognome"));
            bean.setEmail(utente.getEmail());
            try {
                if (dao.doModifyMetodo(bean)) {
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
