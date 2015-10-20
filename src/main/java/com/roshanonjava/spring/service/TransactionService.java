package com.roshanonjava.spring.service;

import java.util.List;

import com.roshanonjava.spring.model.Transaction;

public interface TransactionService {




	public void addTransaction(Transaction p);
	public void updateTransaction(Transaction p);
	public List<Transaction> listTransactions();
	public List<Transaction> listTransactions(String datefrom, String dateto);
	public List<Transaction> listTransactions(String mobile);
	public Transaction getTransactionById(int id);
	public Transaction getTransactionByMobile(String id);
	public void removeTransaction(int id);
	


}
