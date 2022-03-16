package com.bebeno.mvc.payment.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {

	private String id;
	
	private int wine_bno;
	
	private int cart_id;
	
	private int cart_qty;
	
	private Date addDate;
}