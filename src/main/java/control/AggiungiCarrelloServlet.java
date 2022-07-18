package control;

import model.bean.ArticoloBean;
import model.bean.ArticoloCarrello;
import model.bean.Carrello;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/aggiungicarrello")
public class AggiungiCarrelloServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        int qta= Integer.parseInt(req.getParameter("qta"));
        ArticoloBean articolo = (ArticoloBean) session.getAttribute("articolo");
        ArticoloCarrello articoloCarrello = new ArticoloCarrello(articolo, qta);
        Carrello c = (Carrello) session.getAttribute("carrello");
        if(c == null) {
            c = new Carrello();
            session.setAttribute("carrelllo", c);
        }
        c.addArticolo(articoloCarrello);
        session.setAttribute("carrello", c);
        resp.sendRedirect("view/Shop.jsp");


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
