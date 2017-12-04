package br.com.matricula.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.matricula.dao.UsuarioDAO;
import br.com.matricula.exception.PersistenciaException;
import br.com.matricula.model.UsuarioModel;

public class UsuarioController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UsuarioDAO usuarioDAO = new UsuarioDAO();

	private RequestDispatcher view = null;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String acao = request.getParameter("acao");

		switch (acao) {
		case "incluir":
			view = request.getRequestDispatcher(path("incluir.jsp"));
			break;
		case "editar":
			try {
				request.setAttribute("usuario", usuarioDAO.encontrar(Long
						.parseLong(request.getParameter("id"))));
			} catch (NumberFormatException | PersistenciaException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			view = request.getRequestDispatcher(path("editar.jsp"));
			break;
		case "apagar":
			try {
				usuarioDAO.Apagar(Long.parseLong(request.getParameter("id")));
				request.setAttribute("usuarios", usuarioDAO.todos());
			} catch (NumberFormatException | PersistenciaException e) {
				e.printStackTrace();
			}

			view = request.getRequestDispatcher(path("index.jsp"));
			break;
		case "listar":
			try {

				request.setAttribute("usuarios", usuarioDAO.todos());
			} catch (PersistenciaException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			view = request.getRequestDispatcher(path("index.jsp"));
			break;
		default:
			view = request.getRequestDispatcher("errors/404.jsp");
		}

		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		UsuarioModel usuarioModel = new UsuarioModel();
		if (!request.getParameter("id").isEmpty())
			usuarioModel.setId(new Long(request.getParameter("id")));
		usuarioModel.setNome(request.getParameter("nome"));
		usuarioModel.setSenha(request.getParameter("senha"));
		usuarioModel.setLogin(request.getParameter("login"));
		usuarioModel.setNivel(new Integer(request.getParameter("nivel")));

		//FALTA VALIDAR USUÃRIO
		
		if (usuarioModel.getId() == null)
			try {
				usuarioDAO.cadastrarUsuario(usuarioModel);
			} catch (PersistenciaException e) {
				e.printStackTrace();
			}
		else
			try {
				usuarioDAO.Atualizar(usuarioModel);
			} catch (PersistenciaException e) {
				e.printStackTrace();
			}

		HttpSession session = request.getSession(false);
        System.out.println("User="+session.getAttribute("login"));
        if(session.getAttribute("login") == null){
        	response.sendRedirect("login.jsp");
        }else{
        	response.sendRedirect("usuario?acao=listar");
        		
        }
		

	}

	private String path(String page) {
		StringBuilder builder = new StringBuilder("usuario/");
		return builder.append(page).toString();
	}
}
