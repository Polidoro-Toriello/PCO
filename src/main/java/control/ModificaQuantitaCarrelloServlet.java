package control;

import model.bean.ArticoloCarrello;
import model.bean.Carrello;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/modificaquantitaarticolo")
public class ModificaQuantitaCarrelloServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        int nuovaQuantita = Integer.parseInt(req.getParameter("nuovaq"));
        int articoloid = Integer.parseInt(req.getParameter("idArticolo"));
        Carrello c = (Carrello) session.getAttribute("carrello");

        //Usa la servlet che rimuove l'articolo dal carrello
        if(nuovaQuantita == 0) {
            resp.sendRedirect("/rimuovicarrello");
        }

        //altrimenti modifica la quantità
        c.modifyQuantity(articoloid, nuovaQuantita);
        resp.sendRedirect("view/Carrello.jsp");


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
