package com.roshanonjava.spring.dao;

import java.util.List;

import com.roshanonjava.spring.model.Transaction;

public interface TransactionDAO {

	public void addTransaction(Transaction p);

	public void updateTransaction(Transaction p);

	public List<Transaction> listTransactions();

	public Transaction getTransactionById(int id);

	public void removeTransaction(int id);
	
	public Transaction getTransactionByMobile(String id);

	public List<Transaction> listTransactions(String datefrom, String dateto);
	
	
}
