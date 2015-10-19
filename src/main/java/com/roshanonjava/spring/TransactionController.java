package com.roshanonjava.spring;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.roshanonjava.spring.model.Item;
import com.roshanonjava.spring.model.OperationParameters;
import com.roshanonjava.spring.model.Report;
import com.roshanonjava.spring.model.Transaction;
import com.roshanonjava.spring.model.TransactionHolder;
import com.roshanonjava.spring.service.ItemService;
import com.roshanonjava.spring.service.TransactionService;
import com.roshanonjava.util.DateUtils;

@Controller
@RequestMapping(value = "/transaction")
public class TransactionController {

	private TransactionService transactionService;

	@Autowired(required = true)
	@Qualifier(value = "transactionService")
	public void setTransactionService(TransactionService ps) {
		this.transactionService = ps;
	}

	private ItemService itemService;

	@Autowired(required = true)
	@Qualifier(value = "itemService")
	public void setItemService(ItemService ps) {
		this.itemService = ps;
	}

	@RequestMapping(value = "/newTransaction", method = RequestMethod.GET)
	public ModelAndView printWelcome(
			@ModelAttribute("transactionHolder") TransactionHolder transactionHolder) {
		transactionHolder.setDob(DateUtils.convertFromDate(new Date()));
		ModelAndView mav = new ModelAndView("lazyRowLoad");
		mav.addObject("message", "Hello World!!!");
		return mav;

	}

	@RequestMapping(value = "/newTransaction", method = RequestMethod.POST)
	public ModelAndView lazyRowAdd(
			@ModelAttribute("transactionHolder") TransactionHolder transactionHolder)
			throws ParseException {

		// TransactionHolder users=new TransactionHolder();
		ModelAndView mav = new ModelAndView("lazyRowLoadShow");
		saveTransaction(transactionHolder);
		transactionHolder.cleanUp();
		mav.addObject("transactionHolder1", transactionHolder);
		mav.addObject("transactionHolder", new TransactionHolder());
		return mav;

	}

	@RequestMapping(value = "/loadCustomer", method = RequestMethod.POST)
	public ModelAndView loadCustomer(
			@RequestParam("mobileSearch") String mobileSearch,
			@ModelAttribute("transactionHolder") TransactionHolder transactionHolder) {
		System.out.println(mobileSearch);
		Transaction load = transactionService
				.getTransactionByMobile(mobileSearch);
		transactionHolder.setName(load.getName());
		transactionHolder.setArea(load.getArea());
		transactionHolder.setPhone(load.getMobile());
		transactionHolder.setEmail(load.getEmail());
		String date = new SimpleDateFormat("yyyy-MM-dd").format(load
				.getBirthDate());
		transactionHolder.setDob(date);
		ModelAndView mav = new ModelAndView("lazyRowLoad");
		mav.addObject("transactionHolder", transactionHolder);
		return mav;

	}
	
	@RequestMapping(value = "/loadTransaction", method = RequestMethod.POST)
	public String loadTransaction(
			@RequestParam("transactionid") String transactionid) {
		System.out.println(transactionid);
		return "redirect:detail/"+transactionid;

	}
	
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView loadTransactions(@ModelAttribute ("report") Report report) {
		List<Transaction> transactionList = transactionService
				.listTransactions();
		ModelAndView mav = new ModelAndView("transactionList");
		mav.addObject("transactionList", transactionList);
		report.setDateFrom(DateUtils.convertFromDate(new Date()));
		report.setDateTo(DateUtils.convertFromDate(new Date()));
		return mav;

	}
	
	@RequestMapping(value = "/reports", method = RequestMethod.POST)
	public ModelAndView reports(@ModelAttribute ("report") Report report) {
		List<Transaction> transactionList = transactionService
				.listTransactions(report.getDateFrom(),report.getDateTo());
		ModelAndView mav = new ModelAndView("transactionList");
		mav.addObject("transactionList", transactionList);
		mav.addObject("report", report);
		return mav;

	}
	
	
	@RequestMapping(value = "/detail/{orderId}", method = RequestMethod.GET)
	public ModelAndView loadTransactionDetails(@PathVariable String orderId) {
		
		List<Item> itemList = itemService.getItemByTransactionId(Integer.parseInt(orderId));
		ModelAndView mav = new ModelAndView("transactionDetails");
		mav.addObject("itemList", itemList);
		try {
			mav.addObject("transaction", transactionService.getTransactionById(Integer.parseInt(orderId)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mav;

	}

	private void saveTransaction(TransactionHolder transactionHolder)
			throws ParseException {
		// TODO Auto-generated method stub
		int amount = 0;
		Transaction transaction = new Transaction();
		transaction.setArea(transactionHolder.getArea());
		transaction.setMobile(transactionHolder.getPhone());
		transaction.setCreatedDate(new Date());
		transaction.setName(transactionHolder.getName());
		transaction.setModifiedDate(new Date());
		transaction.setEmail(transactionHolder.getEmail());
		DateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		transaction.setBirthDate(formatter1.parse(transactionHolder.getDob()));
		transactionService.addTransaction(transaction);
		transactionHolder.setInvoiceNumber(String.valueOf(transaction.getId()));
		List<OperationParameters> listOfItems = transactionHolder
				.getOperationParameterses();
		for (OperationParameters operationParameters : listOfItems) {
			Item item = new Item();
			if(operationParameters.getItems()==null&&operationParameters.getName()==null&&operationParameters.getPrice()==null){
				continue;
			}
			item.setName(operationParameters.getName());
			item.setDescription("NA");
			item.setPrice(Integer.parseInt(operationParameters.getPrice()));
			item.setCreatedDate(new Date());
			item.setModifiedDate(new Date());
			item.setTransactionRef(transaction.getId());
			item.setQuantity(Integer.parseInt(operationParameters.getItems()));
			amount = amount
					+ (Integer.parseInt(operationParameters.getPrice()) * Integer
							.parseInt(operationParameters.getItems()));
			itemService.addItem(item);
		}
		transactionHolder.setTotalAmount(String.valueOf(amount));
		transaction.setTotalAmount(amount);
		transactionService.updateTransaction(transaction);
	}

}