/**
 * 
 */
package com.roshanonjava.spring.dao;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.roshanonjava.spring.model.Transaction;
import com.roshanonjava.util.DateUtils;

/**
 * @author roshankumarm
 *
 */
@Repository
@Transactional
public class TransactioDAOImpl implements TransactionDAO {

	private static final Logger logger = LoggerFactory.getLogger(TransactioDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	/**
	 * 
	 */
	public TransactioDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see com.journaldev.spring.dao.TransactionDAO#addTransaction(com.journaldev.spring.model.Transaction)
	 */
	@Override
	public void addTransaction(Transaction p) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Transaction saved successfully, Transaction Details="+p);
	}

	/* (non-Javadoc)
	 * @see com.journaldev.spring.dao.TransactionDAO#updateTransaction(com.journaldev.spring.model.Transaction)
	 */
	@Override
	public void updateTransaction(Transaction p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Transaction updated successfully, Transaction Details="+p);

	}

	/* (non-Javadoc)
	 * @see com.journaldev.spring.dao.TransactionDAO#listTransactions()
	 */
	@Override
	public List<Transaction> listTransactions() {
		return this.listTransactions(DateUtils.convertFromDate(new Date()), DateUtils.convertFromDate(new Date()));
	}

	/* (non-Javadoc)
	 * @see com.journaldev.spring.dao.TransactionDAO#getTransactionById(int)
	 */
	@Override
	public Transaction getTransactionById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Transaction p = (Transaction) session.load(Transaction.class, new Integer(id));
		logger.info("Transaction loaded successfully, Transaction details="+p);
		return p;
	}
	
	
	
	
	public Transaction getTransactionByMobile(String mobile) {
		Session session = this.sessionFactory.getCurrentSession();		
		Criteria cr = session.createCriteria(Transaction.class);
		cr.add(Restrictions.eq("mobile", mobile));
		List<Transaction> list = cr.list();
	    return list.get(0);
	}
	

	/* (non-Javadoc)
	 * @see com.journaldev.spring.dao.TransactionDAO#removeTransaction(int)
	 */
	@Override
	public void removeTransaction(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Transaction p = (Transaction) session.load(Transaction.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Person deleted successfully, person details="+p);

	}
	@Override
	public List<Transaction> listTransactions(String datefrom, String dateto) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();		
		List<Transaction> list = null;
		Calendar c = Calendar.getInstance(); 
		try {
			c.setTime(DateUtils.convertToDate(dateto));
			c.add(Calendar.DATE, 1);
			c.getTime();
			list = session.createQuery("FROM Transaction AS c WHERE c.createdDate BETWEEN :stDate AND :edDate ")
			.setParameter("stDate", DateUtils.convertToDate(datefrom))
			.setParameter("edDate", c.getTime())
			.list();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
