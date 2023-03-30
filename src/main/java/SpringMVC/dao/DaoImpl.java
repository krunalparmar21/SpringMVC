package SpringMVC.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import SpringMVC.Bean.Address;
import SpringMVC.Bean.User;
import SpringMVC.util.HibernateUtil;

public class DaoImpl implements Dao {

	SessionFactory factory = HibernateUtil.getSessionFactory();

	// This method for register
	@SuppressWarnings("unchecked")

	@Override
	public boolean insertUser(User user) {
		Transaction transaction = null;
		
		
		for(Address address : user.getAddress()) {
			address.setUser(user);
		}
		try (Session session = factory.openSession()) {
			String hql;
			transaction = session.beginTransaction();
		
			List<Address> updateData=user.getAddress();
			if(user.getId() != 0) {
				StringBuilder sb= new StringBuilder();
				if(updateData.size() != 0) {
					for(int j=0;j<updateData.size();j++){  
						if(j == updateData.size()-1) {
							sb.append( " "+updateData.get(j).getid());
						}
						else {
							sb.append( " "+updateData.get(j).getid()+"," );
						}
					}
					hql="delete from Address where id not in ("+sb+") and user_fk="+user.getId();
				}
				else {
					hql="delete from Address  where user_fk="+user.getId();
				}
				session.createNativeQuery(hql).executeUpdate();
				
			}

			session.saveOrUpdate(user);
			transaction.commit();
			session.close();

		} catch (Exception e) {
			if (transaction != null) {
				System.out.println("Hello insert method ");
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return true;
	}

	// This method for login
	@Override
	public boolean userVaildate(String email, String password) {
		Session session = factory.openSession();
		Query query = session.createQuery("from User where email=:email and password=:password");
		query.setParameter("email", email);
		query.setParameter("password", password);
		if (!query.list().isEmpty()) {
			System.out.println("\n-> " + email + " User is exist.");
			session.close();
			return true;
		} else {
			System.out.println("\n-> " + email + " User is not exist.");
			session.close();
			return false;
		}
	}

	// This method for set user data into session
	public User userGet(String email) {

		User user = null;
		try (Session session = factory.openSession()) {
			Query query = session.createQuery("from User where email=:email");
			query.setParameter("email", email);
			user = (User) query.uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<User> getEmployees() {
		List<User> userData;
		try (Session session = factory.openSession()) {
			Query query = session.createQuery("from User");
			userData = query.list();
			return userData;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean deleteEmployee(int id) {
		Transaction transaction = null;
		try (Session session = factory.openSession()) {
			transaction = session.beginTransaction();
			User userId = session.get(User.class, id);
			session.delete(userId);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
}
