package br.com.matricula.factory;


import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ConexaoFactory {
	
	
	public static Connection getConexao() throws NamingException, SQLException {
		 
		Context	ctx = new InitialContext();
		DataSource	ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/matricula_bd");
	    return ds.getConnection();		
		
		
	}	
	public static void main(String[] args) {
		try {
			System.out.println(getConexao());
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
