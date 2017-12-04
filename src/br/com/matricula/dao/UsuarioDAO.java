package br.com.matricula.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import br.com.matricula.exception.PersistenciaException;
import br.com.matricula.factory.ConexaoFactory;
import br.com.matricula.model.UsuarioModel;

public class UsuarioDAO {
	/**
	 * M�todo de autentica��o de usuario
	 * @param usuarioModel
	 * @return
	 * @throws PersistenciaException
	 */

	public boolean validarUsuario(UsuarioModel usuarioModel) throws PersistenciaException {
		Connection conexao = null;
		try {
			conexao = ConexaoFactory.getConexao();
			
			StringBuilder sql = new StringBuilder();
			sql.append("select * from usuario ");
			sql.append("where login = ? and senha = md5(?) ");
			
			PreparedStatement statement = conexao.prepareStatement(sql.toString());
			statement.setString(1,usuarioModel.getLogin());
			statement.setString(2,usuarioModel.getSenha());
			
			ResultSet resultSet = statement.executeQuery();
			return resultSet.next();
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new PersistenciaException(e);
		} finally {
			try {
				conexao.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public void cadastrarUsuario(UsuarioModel usuarioModel) throws PersistenciaException {
		Connection conexao = null;
		try {
			conexao = ConexaoFactory.getConexao();
		
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO usuario (nome, login, senha) VALUES ");
			sql.append("(?,?,md5(?))");
			
			PreparedStatement statement = conexao.prepareStatement(sql.toString());
			statement.setString(1,usuarioModel.getNome());
			statement.setString(2,usuarioModel.getLogin());
			statement.setString(3,usuarioModel.getSenha());
			
			statement.execute();
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new PersistenciaException(e);
		} finally {
			try {
				conexao.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
		
	public List<UsuarioModel> todos()  throws PersistenciaException {
		Connection conexao = null;
		List<UsuarioModel> usuarioLista = new ArrayList<UsuarioModel>();
		try {
			conexao = ConexaoFactory.getConexao();
		
			String query = "select * from usuario";
			PreparedStatement stmt = conexao.prepareStatement(query);
			ResultSet result = stmt.executeQuery();
			while(result.next()){
				
				UsuarioModel usuarioModel = new UsuarioModel();
				usuarioModel.setId(result.getLong("id"));
				usuarioModel.setNome(result.getString("nome"));
				usuarioModel.setLogin(result.getString("login"));
				usuarioModel.setSenha(result.getString("senha"));
				usuarioModel.setNivel(result.getInt("nivel"));
				usuarioLista.add(usuarioModel);
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new PersistenciaException(e);
		} finally {
			try {
				conexao.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return usuarioLista;
	}

	
	public void salvar(UsuarioModel usuarioModel)  throws PersistenciaException {
		Connection conexao = null;
		try {
			conexao = ConexaoFactory.getConexao();
		
			String query = "insert into usuario values (nextval('usuario_seq'), ?, ?, md5(?), ?)";
			PreparedStatement stmt = conexao.prepareStatement(query);
			stmt.setString(1, usuarioModel.getNome());
			stmt.setString(2, usuarioModel.getLogin());
			stmt.setString(3, usuarioModel.getSenha());
			stmt.setInt(4, usuarioModel.getNivel());
			stmt.execute();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new PersistenciaException(e);
		} finally {
			try {
				conexao.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	public UsuarioModel encontrar(Long id)  throws PersistenciaException {
		UsuarioModel usuarioModel = new UsuarioModel();
		Connection conexao = null;
		try {
			conexao = ConexaoFactory.getConexao();
		
			String query = "select * from usuario where id = ?";
			PreparedStatement stmt = conexao.prepareStatement(query);
			stmt.setLong(1, id);
			ResultSet result = stmt.executeQuery();
			while(result.next()){
				usuarioModel.setId(result.getLong("id"));
				usuarioModel.setNome(result.getString("nome"));
				usuarioModel.setLogin(result.getString("login"));
				usuarioModel.setSenha(result.getString("senha"));
				usuarioModel.setNivel(result.getInt("nivel"));
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new PersistenciaException(e);
		} finally {
			try {
				conexao.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return usuarioModel;
	}
	
	
	public void Atualizar(UsuarioModel usuarioModel)  throws PersistenciaException {
		Connection conexao = null;
		try {
			conexao = ConexaoFactory.getConexao();
		
			String query = "update usuario set nome = ?, login = ?, senha = md5(?), nivel = ? where id = ?";
			PreparedStatement stmt = conexao.prepareStatement(query);
			stmt.setString(1, usuarioModel.getNome());
			stmt.setString(2, usuarioModel.getLogin());
			stmt.setString(3, usuarioModel.getSenha());
			stmt.setInt(4, usuarioModel.getNivel());
			stmt.setLong(5, usuarioModel.getId());
			stmt.executeUpdate();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new PersistenciaException(e);
		} finally {
			try {
				conexao.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void Apagar(Long id)  throws PersistenciaException {
		Connection conexao = null;
		try {
			conexao = ConexaoFactory.getConexao();
		
			String query = "delete from usuario where id = ?";
			PreparedStatement stmt = conexao.prepareStatement(query);
			stmt.setLong(1, id);
			stmt.executeUpdate();
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new PersistenciaException(e);
		} finally {
			try {
				conexao.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
