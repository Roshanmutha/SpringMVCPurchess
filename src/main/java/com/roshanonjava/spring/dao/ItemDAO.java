package com.roshanonjava.spring.dao;

import java.util.List;

import com.roshanonjava.spring.model.Item;

public interface ItemDAO {

	public void addItem(Item p);

	public void updateItem(Item p);

	public List<Item> listItems();

	public Item getItemById(int id);
	
	public List<Item> getItemByTransactionId(int id);

	public void removeItem(int id);
	
}
