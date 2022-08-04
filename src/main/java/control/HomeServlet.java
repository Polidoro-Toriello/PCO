package control;

import model.bean.ArticoloBean;
import model.dao.ArticoloDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private ArticoloDao dao = new ArticoloDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getSession().removeAttribute("alertMsg");
        Collection<ArticoloBean> articoli = null;
        try {
            articoli = dao.doRetrieveLastArrive();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        req.getSession().setAttribute("articoli",articoli);
        resp.sendRedirect("view/Home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    }
}