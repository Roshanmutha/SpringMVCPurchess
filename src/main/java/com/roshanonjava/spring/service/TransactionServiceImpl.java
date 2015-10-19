package com.roshanonjava.spring.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.roshanonjava.spring.dao.TransactionDAO;
import com.roshanonjava.spring.model.Transaction;

public class TransactionServiceImpl implements TransactionService {
	
	private TransactionDAO transactionDAO;

	public void setTransactionDAO(TransactionDAO TransactionDAO) {
		this.transactionDAO = TransactionDAO;
	}

	@Override
	@Transactional
	public void addTransaction(Transaction p) {
		this.transactionDAO.addTransaction(p);
	}

	@Override
	@Transactional
	public void updateTransaction(Transaction p) {
		this.transactionDAO.updateTransaction(p);
	}

	@Override
	@Transactional
	public List<Transaction> listTransactions() {
		return this.transactionDAO.listTransactions();
	}

	@Override
	@Transactional
	public Transaction getTransactionById(int id) {
		return this.transactionDAO.getTransactionById(id);
	}

	@Override
	@Transactional
	public void removeTransaction(int id) {
		this.transactionDAO.removeTransaction(id);
	}

	@Override
	public Transaction getTransactionByMobile(String mobile) {
		return this.transactionDAO.getTransactionByMobile(mobile);
	}

	@Override
	public List<Transaction> listTransactions(String datefrom, String dateto) {
		// TODO Auto-generated method stub
		return this.transactionDAO.listTransactions(datefrom, dateto);
	}

}
