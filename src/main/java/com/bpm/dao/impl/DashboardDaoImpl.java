package com.bpm.dao.impl;


import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.bpm.dao.inf.AbstractDao;
import com.bpm.dao.inf.DashboardDaoInf;
import com.bpm.model.CartItem;
import com.bpm.model.CatalogItem;
import com.bpm.model.DashboardDetails;
import com.bpm.model.Quote;
import com.bpm.model.User;

@Repository("dashboardDao")
@Transactional
public class DashboardDaoImpl extends AbstractDao<Integer, DashboardDetails> implements DashboardDaoInf{
	private static Logger log = Logger.getLogger(DashboardDaoImpl.class.getName()); 
	
	@SuppressWarnings("rawtypes")
	@Override
	public List getDashBoardDetails() {
		log.info("DashboardDaoImpl.java : getDashBoardDetails");
		
		Session session = getEntityManager().unwrap(Session.class);
		
		@SuppressWarnings("unchecked")
		List<Integer> totalDealsUploadedResultList = getEntityManager()
                .createQuery("SELECT count(dtd.dealUniqueId) FROM DealsTempDetails dtd")
                .getResultList();
		String totalDealsUploaded = ""+totalDealsUploadedResultList.get(0);
		 
		@SuppressWarnings("unchecked")
		List<Integer> totalDealsAcceptedResultList = getEntityManager()
                .createQuery("SELECT count(dad.dealUniqueId) FROM DealsAcceptedDetails dad")
                .getResultList();
		String totalDealsAccepted = ""+totalDealsAcceptedResultList.get(0);

		@SuppressWarnings("unchecked")
		List<Integer> totalDealsRejectedResultList = getEntityManager()
                .createQuery("SELECT count(drd.dealUniqueId) FROM DealsRejectedDetails drd")
                .getResultList();
		String totalDealsRejected =  "" + totalDealsRejectedResultList.get(0);
		

		@SuppressWarnings("unchecked")
		List<Integer> totalOrderCurrencyResultList = getEntityManager()
                .createQuery("SELECT count(distinct dad.orderCurrIso) FROM DealsAcceptedDetails dad")
                .getResultList();
		String totalOrderCurrency = "" + totalOrderCurrencyResultList.get(0);

		String dealsPerCurrencySql = "select dcia.order_curr_iso, count(dcia.order_curr_iso) "
				+ " from deals_csv_import_accepted dcia, currency curr " 
				+ " where curr.CURRENCY_ISO_CODE = dcia.order_curr_iso "
				+ " group by dcia.ORDER_CURR_ISO ";
		List<List<Object>> dealsPerCurrencyResult = session.createSQLQuery(dealsPerCurrencySql).setResultTransformer(Transformers.TO_LIST).list();
		
		Map<String,Integer> dealsPerCurrencyMap = new HashMap();
		for (List<Object> object : dealsPerCurrencyResult) {
			dealsPerCurrencyMap.put((String)object.get(0),((BigInteger) object.get(1)).intValue());
		}
		
		System.out.println("\t totalDealsUploadedResult : " + totalDealsUploadedResultList.get(0)
		+"\n\t totalDealsAcceptedResult : " + totalDealsAcceptedResultList.get(0)
		+"\n\t totalDealsRejectedResult : " + totalDealsRejectedResultList.get(0)
		+ "\n\t totalOrderCurrencyResult : " + totalOrderCurrencyResultList.get(0)
		+ "\n\t dealsPerCurrencyMap : " + dealsPerCurrencyMap.toString()
		);
		
		
		List<DashboardDetails> dashboardList = null;
		DashboardDetails dashboardBean = new DashboardDetails();
		dashboardBean.setPageName("DashBoard");
		dashboardBean.setSavingDetails("Total Deals Uploaded");
		dashboardBean.setSavingAmount(totalDealsUploaded);
		dashboardBean.setEarningDetails("Total Deals Accepted");
		dashboardBean.setEarningAmount(totalDealsAccepted);
		dashboardBean.setOwedDetails("Total Deals Rejected");
		dashboardBean.setOwedAmount(totalDealsRejected);
		dashboardBean.setExpensesDetails("Total no of dealing Currency");
		dashboardBean.setExpensesAmount(totalOrderCurrency);
		dashboardBean.setDealsPerCurrencyMap(dealsPerCurrencyMap);
		
		
		dashboardList = new ArrayList<DashboardDetails>();
		dashboardList.add(dashboardBean);
		
		return dashboardList;
	}



	@Override
	public List getCatalogDetails() {
		log.debug("DashboardDaoImpl.java : getCatalogDetails()");

		String getCatalogDetailsURI = "http://localhost:8080/Catalog/catalog/getCatalogDetails";
		
	    RestTemplate restTemplate = new RestTemplate();
	    List<CatalogItem> catalogItemList =  (List<CatalogItem>) restTemplate.getForObject(getCatalogDetailsURI, ArrayList.class);
	    
	    log.debug("\t catalogItemList :" + catalogItemList.toString());
		System.out.println("\t catalogItem.size() : " + catalogItemList.size() + "\n\t catalogItemList :" + catalogItemList.toString());
		return catalogItemList;
	}
	
	@Override
	public List saveToCart(String cartItemList) {
		System.out.println("DashboardDaoImpl.java : saveToCart()");
		System.out.println("\t cartItemList : " + cartItemList);
		log.debug("DashboardDaoImpl.java : saveToCart()");

		String saveToCartURL = "http://localhost:8080/Catalog/cart/saveToCart";
		
		RestTemplate restTemplateQuote = new RestTemplate();
        HashMap cartItemMap = restTemplateQuote.postForObject(saveToCartURL, cartItemList,  HashMap.class) ;
        
        log.debug("\t cartItemMap : " + cartItemMap.toString());
        System.out.println("\t cartItemMap : " + cartItemMap.toString());
        
		List cartList = new ArrayList();
		cartList.add(cartItemMap);
		
		/*
		CartItem cartItem = new CartItem();
		cartItem.setItemId(1000);
		cartItem.setName("Paracetamol1");
		cartItem.setItemCount(10);
		cartList.add(cartItem);

		cartItem = new CartItem();
		cartItem.setItemId(1001);
		cartItem.setName("Solvin Cold Tablet1");
		cartItem.setItemCount(1);
		cartList.add(cartItem);
		*/
		
		System.out.println("\t cartList.size() : " + cartList.size());
		return cartList;
	}	


	@Override
	public HashMap createUser(String userDetails) {
		log.info("DashboardDaoImpl.java : createUser()");
		
		String createUserUrl = "http://localhost:8080/User/user/createUser";
		RestTemplate restTemplateQuote = new RestTemplate();
        HashMap userDetailsMap = restTemplateQuote.postForObject(createUserUrl, userDetails,  HashMap.class) ;
        
        log.debug("\t userDetailsMap : " + userDetailsMap.toString());
        System.out.println("\t userDetailsMap : " + userDetailsMap.toString());

        
		List userList = new ArrayList<User>();
		User user = new User(); 
		
		user.setLogin("rahil");
		user.setPassword("*******");
		user.setUsername("Rahil Khan");
		user.setAddress("ASF,GGN");
		user.setCity("GGN");
		user.setState("Haryana");
		user.setCountry("India");
		user.setZip("122003");
		user.setCreditcard("2367982345091298");
		userList.add(user);
		
		System.out.println("\t userDetailsMap.size() : " + userDetailsMap.size());
		return userDetailsMap;
		
	}

}
