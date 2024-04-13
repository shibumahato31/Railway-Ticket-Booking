package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import dto.Customer;

public class UserDao {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("dev");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et=em.getTransaction();

	public void save(Customer u) {
		et.begin();
		em.persist(u);
		et.commit();
	}

	public Customer find(int userid) {
		return em.find(Customer.class, userid);
	}
	
	public void update(Customer user) {
		et.begin();
		em.merge(user);
		et.commit();
	}
}
