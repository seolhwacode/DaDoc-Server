package com.team1.dadoc.trade.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TradeController {
	@Autowired
	
	
	@RequestMapping("/trade/list")
	public String getList(HttpServletRequest request) {
		
		
		return "trade/list";
	}
}
