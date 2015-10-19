/**
 * 
 */
package com.roshanonjava.spring.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.roshanonjava.spring.model.Item;

/**
 * @author roshankumarm
 *
 */
@Repository
@Transactional
public class ItemDAOImpl implements ItemDAO {

	private static final Logger logger = LoggerFactory.getLogger(TransactioDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	/**
	 * 
	 */
	public ItemDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see com.journaldev.spring.dao.ItemDAO#addItem(com.journaldev.spring.model.Item)
	 */
	@Override
	public void addItem(Item p) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Item saved successfully, Item Details="+p);
	}

	/* (non-Javadoc)
	 * @see com.journaldev.spring.dao.ItemDAO#updateItem(com.journaldev.spring.model.Item)
	 */
	@Override
	public void updateItem(Item p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Item updated successfully, Item Details="+p);

	}

	/* (non-Javadoc)
	 * @see com.journaldev.spring.dao.ItemDAO#listItems()
	 */
	@Override
	public List<Item> listItems() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Item> ItemList = session.createQuery("from Item").list();
		for(Item p : ItemList){
			logger.info("Item List::"+p);
		}
		return ItemList;
	}

	/* (non-Javadoc)
	 * @see com.journaldev.spring.dao.ItemDAO#getItemById(int)
	 */
	@Override
	public Item getItemById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Item p = (Item) session.load(Item.class, new Integer(id));
		logger.info("Item loaded successfully, Item details="+p);
		return p;
	}

	/* (non-Javadoc)
	 * @see com.journaldev.spring.dao.ItemDAO#removeItem(int)
	 */
	@Override
	public void removeItem(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Item p = (Item) session.load(Item.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Person deleted successfully, person details="+p);

	}
	@Override
	public List<Item> getItemByTransactionId(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Criteria cr = session.createCriteria(Item.class);
		cr.add(Restrictions.eq("transactionRef", id));
		List<Item> list = cr.list();
	    return list;
	}

}
