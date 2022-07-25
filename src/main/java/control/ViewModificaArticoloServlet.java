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

@WebServlet("/viewmodifica")
public class ViewModificaArticoloServlet extends HttpServlet {

    private ArticoloDao dao = new ArticoloDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        int idarticolo = Integer.parseInt(req.getParameter("idArticolo"));
        ArticoloBean bean = new ArticoloBean();
        try {
            bean = dao.doRetrieveById(idarticolo);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        session.setAttribute("articolo",bean);
        resp.sendRedirect("view/ModificaArticolo.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
