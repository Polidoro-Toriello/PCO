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
import java.util.ArrayList;
import java.util.Collection;

@WebServlet("/catalogoarticoli")
public class CatalogoArticoliServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Collection<ArticoloBean> articoli = new ArrayList<ArticoloBean>();
        if(req.getParameter("categoria")!=null) {
            try {
                String categoria = req.getParameter("categoria");
                switch (categoria) {
                    case "tutti":
                        articoli = ArticoloDao.doRetrieveAll();
                        session.setAttribute("articoli", articoli);
                        resp.sendRedirect("view/Home.jsp");
                        break;
                    case "RAM":
                        articoli = ArticoloDao.doRetrieveCategoria("RAM");
                        session.setAttribute("articoli", articoli);
                        resp.sendRedirect("view/Home.jsp");
                        break;
                    case "CPU":
                        articoli = ArticoloDao.doRetrieveCategoria("CPU");
                        session.setAttribute("articoli", articoli);
                        resp.sendRedirect("view/Home.jsp");
                        break;
                    case "GPU":
                        articoli = ArticoloDao.doRetrieveCategoria("GPU");
                        session.setAttribute("articoli", articoli);
                        resp.sendRedirect("view/Home.jsp");
                        break;
                    case "SSD":
                        articoli = ArticoloDao.doRetrieveCategoria("SSD");
                        session.setAttribute("articoli", articoli);
                        resp.sendRedirect("view/Home.jsp");
                        break;
                    case "HDD":
                        articoli = ArticoloDao.doRetrieveCategoria("HDD");
                        session.setAttribute("articoli", articoli);
                        resp.sendRedirect("view/Home.jsp");
                        break;
                    case "PC":
                        articoli = ArticoloDao.doRetrieveCategoria("PC");
                        session.setAttribute("articoli", articoli);
                        resp.sendRedirect("view/Home.jsp");
                        break;
                }
            } catch (SQLException | ClassNotFoundException ex) {
                ex.printStackTrace();
                resp.sendRedirect("view/Home.jsp");
            }
        }else {
            session.setAttribute("alertMsg","Errore reindirizzamento al catalogo");
            resp.sendRedirect("view/Home.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
