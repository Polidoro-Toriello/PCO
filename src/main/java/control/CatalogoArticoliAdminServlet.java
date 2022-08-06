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

@WebServlet("/catalogoarticoliadmin")
public class CatalogoArticoliAdminServlet extends HttpServlet {

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
                    resp.sendRedirect("view/CatalogoAdmin.jsp");
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
                        resp.sendRedirect("view/CatalogoAdmin.jsp");
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
                        resp.sendRedirect("view/CatalogAdmin.jsp");
                    }
                }
            } else {
                session.setAttribute("alertMsg", "Errore reindirizzamento al catalogo");
                resp.sendRedirect("view/HomeAdmin.jsp");
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
                switch(articoloBean.getCategoria()) {
                    case "gpu":
                        html += String.format(" <div class=\"product-box\">\n" +
                                "                <img src=\"../immagini/gpu1.jpg\" alt=\"\" class=\"product-img\">\n" +
                                "                <h2 class=\"product-title\">%s &nbsp;\n" +
                                "                    &nbsp;Prezzo:&nbsp;%s&euro;</h2>\n" +
                                "                <a class=\"btn\" href=\"../viewmodifica?idArticolo=%s\">Modifica</a>\n" +
                                "                <a class=\"btn\" href=\"../rimuovicatalogo?idArticolo=%s\">\n" +
                                "                    Rimuovi Prodotto</a>\n" +
                                "            </div>\n", articoloBean.getNome().toUpperCase(), articoloBean.getPrezzo(), articoloBean.getIdArticolo(), articoloBean.getIdArticolo());
                        break;
                    case "pc":
                        html += String.format(" <div class=\"product-box\">\n" +
                                "                <img src=\"../immagini/pc1.jpg\" alt=\"\" class=\"product-img\">\n" +
                                "                <h2 class=\"product-title\">%s &nbsp;\n" +
                                "                    &nbsp;Prezzo:&nbsp;%s&euro;</h2>\n" +
                                "                <a class=\"btn\" href=\"../viewmodifica?idArticolo=%s\">Modifica</a>\n" +
                                "                <a class=\"btn\" id=\"aggiungiCarrello\" href=\"../rimuovicatalogo?idArticolo=%s\">\n" +
                                "                    Rimuovi Prodotto</a>\n" +
                                "            </div>\n", articoloBean.getNome().toUpperCase(), articoloBean.getPrezzo(), articoloBean.getIdArticolo(), articoloBean.getIdArticolo());
                        break;
                    case "cpu":
                        html += String.format(" <div class=\"product-box\">\n" +
                                "                <img src=\"../immagini/cpu1.jpg\" alt=\"\" class=\"product-img\">\n" +
                                "                <h2 class=\"product-title\">%s &nbsp;\n" +
                                "                    &nbsp;Prezzo:&nbsp;%s&euro;</h2>\n" +
                                "                <a class=\"btn\" href=\"../viewmodifica?idArticolo=%s\">Modifica</a>\n" +
                                "                <a class=\"btn\" href=\"../rimuovicatalogo?idArticolo=%s\">\n" +
                                "                    Rimuovi Prodotto</a>\n" +
                                "            </div>\n", articoloBean.getNome().toUpperCase(), articoloBean.getPrezzo(), articoloBean.getIdArticolo(), articoloBean.getIdArticolo());
                        break;
                    case "ram":
                        html += String.format(" <div class=\"product-box\">\n" +
                                "                <img src=\"../immagini/ram1.jpg\" alt=\"\" class=\"product-img\">\n" +
                                "                <h2 class=\"product-title\">%s &nbsp;\n" +
                                "                    &nbsp;Prezzo:&nbsp;%s&euro;</h2>\n" +
                                "                <a class=\"btn\" href=\"../viewmodifica?idArticolo=%s\">Modifica</a>\n" +
                                "                <a class=\"btn\" href=\"../rimuovicatalogo?idArticolo=%s\">\n" +
                                "                    Rimuovi Prodotto</a>\n" +
                                "            </div>\n", articoloBean.getNome().toUpperCase(), articoloBean.getPrezzo(), articoloBean.getIdArticolo(), articoloBean.getIdArticolo());
                        break;
                    case "ssd":
                        html += String.format(" <div class=\"product-box\">\n" +
                                "                <img src=\"../immagini/ssd1.jpg\" alt=\"\" class=\"product-img\">\n" +
                                "                <h2 class=\"product-title\">%s &nbsp;\n" +
                                "                    &nbsp;Prezzo:&nbsp;%s&euro;</h2>\n" +
                                "                <a class=\"btn\" href=\"../viewmodifica?idArticolo=%s\">Modifica</a>\n" +
                                "                <a class=\"btn\" href=\"../rimuovicatalogo?idArticolo=%s\">\n" +
                                "                    Rimuovi Prodotto</a>\n" +
                                "            </div>\n", articoloBean.getNome().toUpperCase(), articoloBean.getPrezzo(), articoloBean.getIdArticolo(), articoloBean.getIdArticolo());
                        break;
                    case "hdd":
                        html += String.format(" <div class=\"product-box\">\n" +
                                "                <img src=\"../immagini/hdd1.jpg\" alt=\"\" class=\"product-img\">\n" +
                                "                <h2 class=\"product-title\">%s &nbsp;\n" +
                                "                    &nbsp;Prezzo:&nbsp;%s&euro;</h2>\n" +
                                "                <a class=\"btn\" href=\"../viewmodifica?idArticolo=%s\">Modifica</a>\n" +
                                "                <a class=\"btn\" href=\"../rimuovicatalogo?idArticolo=%s\">\n" +
                                "                    Rimuovi Prodotto</a>\n" +
                                "            </div>\n", articoloBean.getNome().toUpperCase(), articoloBean.getPrezzo(), articoloBean.getIdArticolo(), articoloBean.getIdArticolo());
                        break;
                }
            }
        }
        return html;

    }
}
