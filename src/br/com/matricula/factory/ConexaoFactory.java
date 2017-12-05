package br.com.matricula.factory;


import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.sql.DataSource;


public class ConexaoFactory {
	
	private static EntityManagerFactory factory;
	
	public static EntityManager getInstancia(){
		if (factory == null ){
			factory = Persistence.createEntityManagerFactory("matriculapadroes");
		}
		
		return factory.createEntityManager();
	}
}
