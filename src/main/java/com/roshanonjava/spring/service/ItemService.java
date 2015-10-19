package com.roshanonjava.spring.service;

import java.util.List;

import com.roshanonjava.spring.model.Item;

public interface ItemService {



	public void addItem(Item p);
	public void updateItem(Item p);
	public List<Item> listItems();
	public Item getItemById(int id);
	public List<Item> getItemByTransactionId(int tId);
	public void removeItem(int id);
	

}
