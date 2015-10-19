package com.roshanonjava.spring.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class TransactionHolder {

	private String name;
	private String dob;
	private String email;
	private String phone;
	private String area;
	private String totalAmount;
	public String getTotalAmount() {
		return totalAmount;
	}

	public void cleanUp() {
		// TODO Auto-generated method stub
		for (Iterator<OperationParameters> iterator = operationParameterses.iterator(); iterator.hasNext();) {
			OperationParameters string = iterator.next();
		    if (string.getItems()==null) {
		        // Remove the current element from the iterator and the list.
		        iterator.remove();
		    }
		}
	}
	
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	private String invoiceNumber;
	
	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	private List<OperationParameters> operationParameterses = LazyList
			.decorate(new ArrayList<OperationParameters>(),
					FactoryUtils.instantiateFactory(OperationParameters.class));

	public TransactionHolder(String name, String dob, String email,
			String phone, String address, Long pincode, String countr,String area) {
		super();
		this.name = name;
		this.dob = dob;
		this.email = email;
		this.phone = phone;
		this.area = area;
	}

	public TransactionHolder() {
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<OperationParameters> getOperationParameterses() {
		return operationParameterses;
	}

	public void setOperationParameterses(
			List<OperationParameters> operationParameterses) {
		this.operationParameterses = operationParameterses;
	}

}
