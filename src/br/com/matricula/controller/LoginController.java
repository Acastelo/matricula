package br.com.matricula.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.matricula.dao.UsuarioDAO;
import br.com.matricula.exception.ControllerException;
import br.com.matricula.exception.PersistenciaException;
import br.com.matricula.model.UsuarioModel;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher view = null;		
		
		try {
			if (!validarUsuario(request)){
				view = request.getRequestDispatcher("loginErro.jsp");
				view.forward(request, response);
			}else{
				HttpSession session = request.getSession();
				session.setAttribute("login", request.getParameter("login") );
				//request.getRequestDispatcher("index.jsp").forward(request, response);
				view = request.getRequestDispatcher("index.jsp");
				view.forward(request, response);
			}
		} catch (ControllerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public boolean validarUsuario(HttpServletRequest request) throws ControllerException {
		boolean isValido = false;
		try {
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
	
			UsuarioModel usuarioModel = new UsuarioModel();
			usuarioModel.setLogin(login);
			usuarioModel.setSenha(senha);
	
			UsuarioDAO usuarioDAO = new UsuarioDAO();
			isValido = usuarioDAO.validarUsuario(usuarioModel);
	
			return isValido;
		}  catch (PersistenciaException e){
			e.printStackTrace();
			throw new ControllerException(e);
		}
	}

	

}
