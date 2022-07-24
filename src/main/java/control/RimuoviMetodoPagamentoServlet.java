package control;

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

@WebServlet("/rimuovimetodo")
public class RimuoviMetodoPagamentoServlet extends HttpServlet {

    private MetodoPagamentoDao dao = new MetodoPagamentoDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String numerocarta = req.getParameter("Numerocarta");
        UserBean utente = (UserBean) session.getAttribute("utente");
        if(utente !=null && !utente.isAdmin()) {
            try {
                if (dao.doDeleteByNumero(numerocarta)) {
                    session.setAttribute("alertMsg", "Metodo di pagamento eliminato!");
                    resp.sendRedirect("view/UserPage.jsp");
                } else {
                    session.setAttribute("alertMsg","Errore cancellazione!");
                    resp.sendRedirect("view/UserPage.jsp");
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            session.setAttribute("alertMsg","Accesso non effettuato");
            resp.sendRedirect("view/Home.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
