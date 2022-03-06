package control;

import model.bean.ArticoloBean;
import model.dao.ArticoloDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/articolo")
public class ArticoloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (req.getParameter("idArticolo") != null) {
            try {
                ArticoloBean articolo = ArticoloDao.doRetrieveById(Integer.parseInt(req.getParameter("idArticolo")));
                if (articolo != null) {
                    session.setAttribute("articolo", articolo);
                    resp.sendRedirect("view/ArticoloPage.jsp");
                } else {
                    session.setAttribute("alertMsg", "Errore nel trovare l'articolo");
                    resp.sendRedirect("view/Shop.jsp");
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                session.setAttribute("alertMsg", "Errore nel trovare l'articolo");
                resp.sendRedirect("view/Shop.jsp");
            }
        } else {
            session.setAttribute("alertMsg", "Errore nel trovare l'articolo");
            resp.sendRedirect("view/Shop.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
