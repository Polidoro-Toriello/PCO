package control;

import model.bean.ArticoloBean;
import model.bean.UserBean;
import model.dao.ArticoloDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/rimuovicatalogo")
public class RimuoviProdottoCatalogoServlet extends HttpServlet{
        private ArticoloDao articoloDao = new ArticoloDao();
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
            int id = Integer.parseInt(req.getParameter("idArticolo"));
            try {
                if (articoloDao.doDeleteArticoloById(id)) {
                    session.setAttribute("alertMsg", "Articolo eliminato!");
                    resp.sendRedirect("view/HomeAdmin.jsp");
                } else {
                    session.setAttribute("alertMsg", "Errore cancellazione articolo");
                    resp.sendRedirect("view/HomeAdmin.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            super.doPost(req, resp);
        }
}

