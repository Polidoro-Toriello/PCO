package control;

import model.bean.OrdineBean;
import model.dao.OrdineDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/cercaordiniutente")
public class CercaOrdiniByUtenteServlet extends HttpServlet {

    private OrdineDao dao = new OrdineDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = req.getParameter("username");
        ArrayList<OrdineBean> ordini = new ArrayList<>();
        try {
            ordini = (ArrayList<OrdineBean>) dao.doRetrieveByUsername(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(ordini.isEmpty()) {
            session.setAttribute("error","Errore nella ricerca!Riprovare");
            resp.sendRedirect("view/ViewOrdini.jsp");
        } else {
            session.setAttribute("ordiniUtente", ordini);
            resp.sendRedirect("view/ViewOrdini.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
