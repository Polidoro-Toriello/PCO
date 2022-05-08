package control;

import model.bean.Carrello;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/rimuovicarrello")
public class RimuoviArticoloCarrelloServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        int idArticolo = Integer.parseInt(req.getParameter("idArticolo"));
        Carrello c = (Carrello) session.getAttribute("carrello");
        c.deleteProdotto(idArticolo);
        session.setAttribute("carrello", c);
        resp.sendRedirect("view/Carrello.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
