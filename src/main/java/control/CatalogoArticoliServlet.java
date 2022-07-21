package control;

import model.bean.ArticoloBean;
import model.dao.ArticoloDao;
import javax.servlet.RequestDispatcher;
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
        String ajax = req.getParameter("ajax");
        System.out.println(ajax);
        Collection<ArticoloBean> articoli = new ArrayList<ArticoloBean>();
        if (req.getParameter("categoria") != null) {
            try {
                String categoria = req.getParameter("categoria");
                switch (categoria) {
                    case "tutti":
                        articoli = ArticoloDao.doRetrieveAll();
                        session.setAttribute("articoli", articoli);
                        session.setAttribute("title", "Tutto il nostro Catalogo");
                        if (ajax == null) {
                            resp.sendRedirect("view/Catalogo.jsp");
                        }
                        break;
                    case "RAM":
                        articoli = ArticoloDao.doRetrieveCategoria("RAM");
                        if (articoli != null) {
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Componenti PC/Memorie Ram");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        } else {
                            articoli = ArticoloDao.doRetrieveAll();
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Tutto il nostro Catalogo");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            session.setAttribute("alertMsg", "Errore inaspettato nel trovare gli articoli richiesti");
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        }
                        break;
                    case "CPU":
                        articoli = ArticoloDao.doRetrieveCategoria("CPU");
                        if (articoli != null) {
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Componenti PC/Processori");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        } else {
                            articoli = ArticoloDao.doRetrieveAll();
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Tutto il nostro Catalogo");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            session.setAttribute("alertMsg", "Errore inaspettato nel trovare gli articoli richiesti");
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        }
                        break;
                    case "GPU":
                        articoli = ArticoloDao.doRetrieveCategoria("GPU");
                        if (articoli != null) {
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Componenti PC/Schede Video");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        } else {
                            articoli = ArticoloDao.doRetrieveAll();
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Tutto il nostro Catalogo");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            session.setAttribute("alertMsg", "Errore inaspettato nel trovare gli articoli richiesti");
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        }
                        break;
                    case "SSD":
                        articoli = ArticoloDao.doRetrieveCategoria("SSD");
                        if (articoli != null) {
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Periferiche PC/Hard Disk");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        } else {
                            articoli = ArticoloDao.doRetrieveAll();
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Tutto il nostro Catalogo");
                            session.setAttribute("alertMsg", "Errore inaspettato nel trovare gli articoli richiesti");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        }
                        break;
                    case "HDD":
                        articoli = ArticoloDao.doRetrieveCategoria("HDD");
                        if (articoli != null) {
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Periferiche PC/SSD Esterni");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        } else {
                            articoli = ArticoloDao.doRetrieveAll();
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Tutto il nostro Catalogo");
                            session.setAttribute("alertMsg", "Errore inaspettato nel trovare gli articoli richiesti");
                            resp.sendRedirect("view/Catalogo.jsp");
                        }
                        break;
                    case "PC":
                        articoli = ArticoloDao.doRetrieveCategoria("PC");
                        if (articoli != null) {
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "PC da Gaming e Professionali");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        } else {
                            articoli = ArticoloDao.doRetrieveAll();
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Tutto il nostro Catalogo");
                            session.setAttribute("alertMsg", "Errore inaspettato nel trovare gli articoli richiesti");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        }
                        break;
                    case "Tastiera":
                        articoli = ArticoloDao.doRetrieveCategoria("tastiera");
                        if (articoli != null) {
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Accessori/Tastiere");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        } else {
                            articoli = ArticoloDao.doRetrieveAll();
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Tutto il nostro Catalogo");
                            session.setAttribute("alertMsg", "Errore inaspettato nel trovare gli articoli richiesti");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        }
                        break;
                    case "Mouse":
                        articoli = ArticoloDao.doRetrieveCategoria("mouse");
                        if (articoli != null) {
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Accessori/Mouse");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        } else {
                            articoli = ArticoloDao.doRetrieveAll();
                            session.setAttribute("articoli", articoli);
                            session.setAttribute("title", "Tutto il nostro Catalogo");
                            session.setAttribute("alertMsg", "Errore inaspettato nel trovare gli articoli richiesti");
                            if(ajax!=null){
                                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("view/Catalogo.jsp");
                                dispatcher.forward(req, resp);
                            }
                            if (ajax == null) {
                                resp.sendRedirect("view/Catalogo.jsp");
                            }
                        }
                        break;
                }
            } catch (SQLException |
                     ClassNotFoundException ex) {
                ex.printStackTrace();
                resp.sendRedirect("view/Home.jsp");
            }
        } else {
            session.setAttribute("alertMsg", "Errore reindirizzamento al catalogo");
            resp.sendRedirect("view/Home.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
