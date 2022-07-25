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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

@WebServlet("/catalogoarticoli")
public class CatalogoArticoliServlet extends HttpServlet {

    private ArticoloDao dao = new ArticoloDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String ajax = req.getParameter("ajax");
        String categoria = req.getParameter("categoria");
        Collection<ArticoloBean> articoli = new ArrayList<ArticoloBean>();

        if (categoria != null) {
            if (categoria.equals("tutti")) {
                try {
                    articoli = dao.doRetrieveAll();
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                if (ajax != null) {
                    PrintWriter writer = resp.getWriter();
                    writer.println(updateCatalogo(articoli));
                }
                if (ajax == null) {
                    session.setAttribute("articoli", articoli);
                    session.setAttribute("title", "Tutto il nostro Catalogo");
                    resp.sendRedirect("view/Catalogo.jsp");
                }
            } else if (!categoria.equals("tutti")) {
                try {
                    articoli = dao.doRetrieveCategoria(categoria);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                if (articoli != null) {
                    switch (categoria) {
                        case "RAM":
                            session.setAttribute("title", "Componenti PC/Memorie Ram");
                            break;
                        case "CPU":
                            session.setAttribute("title", "Componenti PC/Processori");
                            break;
                        case "GPU":
                            session.setAttribute("title", "Componenti PC/Schede Video");
                            break;
                        case "HDD":
                            session.setAttribute("title", "Periferiche PC/Hard Disk");
                            break;
                        case "SSD":
                            session.setAttribute("title", "Periferiche PC/SSD");
                            break;
                        case "PC":
                            session.setAttribute("title", "PC da Gaming e Professionali");
                            break;
                        case "Tastiera":
                            session.setAttribute("title", "Accessori/Tastiere");
                            break;
                        case "Mouse":
                            session.setAttribute("title", "Accessori/Mouse");
                            break;
                    }
                    if (ajax != null) {
                        PrintWriter writer = resp.getWriter();
                        writer.println(updateCatalogo(articoli));
                    }
                    if (ajax == null) {
                        session.setAttribute("articoli", articoli);
                        resp.sendRedirect("view/Catalogo.jsp");
                    }
                } else {
                    try {
                        articoli = dao.doRetrieveAll();
                    } catch (SQLException | ClassNotFoundException e) {
                        throw new RuntimeException(e);
                    }
                    session.setAttribute("articoli", articoli);
                    session.setAttribute("title", "Tutto il nostro Catalogo");
                    if (ajax != null) {
                        PrintWriter writer = resp.getWriter();
                        writer.println(updateCatalogo(articoli));
                    }
                    session.setAttribute("alertMsg", "Errore inaspettato nel trovare gli articoli richiesti");
                    if (ajax == null) {
                        resp.sendRedirect("view/Catalogo.jsp");
                    }
                }
            } else {
                session.setAttribute("alertMsg", "Errore reindirizzamento al catalogo");
                resp.sendRedirect("view/Home.jsp");
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    public String updateCatalogo(Collection<ArticoloBean> catalogo) {
        String html = "";
        if (catalogo == null) {
            html = "Non sono presenti articoli per la categoria selezionata";
        }
        if (catalogo != null) {
            for (ArticoloBean articoloBean : catalogo) {
                html += String.format(" <div class=\"product-box\">\n" +
                        "                <img src=\"../immagini/RTX_3090_TI1.jpg\" alt=\"\" class=\"product-img\">\n" +
                        "                <h2 class=\"product-title\">%s &nbsp;\n" +
                        "                    &nbsp;Prezzo:&nbsp;%s&euro;</h2>\n" +
                        "                <a class=\"btn\" href=\"../articolo?idArticolo=%s\">Vai al Prodotto</a>\n" +
                        "                <a class=\"btn\" id=\"aggiungiCarrello\" href=\"../aggiungicarrello?idArticolo=%s&amp;qta=1\">\n" +
                        "                    <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"25\" height=\"20\" fill=\"currentColor\" class=\"bi bi-bag\" viewBox=\"0 0 16 16\">\n" +
                        "                        <path d=\"M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z\"></path>\n" +
                        "                    </svg>\n" +
                        "                    Aggiungi al Carrello</a>\n" +
                        "            </div>\n", articoloBean.getNome().toUpperCase(), articoloBean.getPrezzo(), articoloBean.getIdArticolo(), articoloBean.getIdArticolo());
            }
        }
        return html;

    }
}
