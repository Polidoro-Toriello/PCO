package control;

import model.bean.ArticoloBean;
import model.bean.ArticoloCarrello;
import model.bean.Carrello;
import model.dao.ArticoloDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/aggiungicarrello")
public class AggiungiCarrelloServlet extends HttpServlet {

    private ArticoloDao dao = new ArticoloDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArticoloBean articolo = (ArticoloBean) session.getAttribute("articolo");
        String paginaCorrente = (String) session.getAttribute("paginaCorrente");
         int qta = 1;
        if (req.getParameter("qta") != null) {
            qta = Integer.parseInt(req.getParameter("qta"));
        }
        if (articolo == null) {
            try {
                articolo = dao.doRetrieveById(Integer.parseInt(req.getParameter("idArticolo")));
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        ArticoloCarrello articoloCarrello = new ArticoloCarrello(articolo, qta);
        Carrello c = (Carrello) session.getAttribute("carrello");
        if (c == null) {
            c = new Carrello();
            session.setAttribute("carrello", c);
        }
        if(c.addArticolo(articoloCarrello)) {
            session.setAttribute("carrello", c);
            session.setAttribute("alertMsg", "true");
            resp.sendRedirect("view/"+paginaCorrente);
        }
        else{
            session.setAttribute("alertMsg", "false");
            resp.sendRedirect("view/Home.jsp");
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
