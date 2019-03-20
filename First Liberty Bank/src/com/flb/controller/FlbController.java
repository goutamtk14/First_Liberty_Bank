package com.flb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flb.dao.DaoFactory;
import com.flb.entity.Account;
import com.flb.service.FlbService;

@Controller
public class FlbController {

	@RequestMapping("/login")
	public ModelAndView Login(HttpServletRequest request, HttpServletResponse response) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (password.equals(FlbService.checkAccountPassword(username))) {

			FlbService.zeroinvalidPasswordCount(username);
			HttpSession session = request.getSession();
			Account useraccount = FlbService.getAccountData(username);
			session.setAttribute("username", username);
			session.setAttribute("accountno", useraccount.getAccountno());
			session.setAttribute("name", useraccount.getName());
			ModelAndView mv = new ModelAndView();
			mv.setViewName("welcome");
			return mv;
		}

		else if (FlbService.checkAccountPassword(username).equals("Invalid")) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("Error", "Invalid Username");
			mv.setViewName("login");
			return mv;
		}

		else {
			FlbService.invalidPasswordCount(username);
			int invalidPasswordCount = DaoFactory.getInvalidPasswordCount(username);
			if (invalidPasswordCount >= 4) {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("lock");
				return mv;

			} else {
				ModelAndView mv = new ModelAndView();
				mv.addObject("Error", "Invalid Password");
				mv.addObject("invalidPasswordCount", 4 - invalidPasswordCount+" attempts remaining");
				mv.setViewName("login");
				return mv;
			}
		}

	}

	@RequestMapping("/register")
	public ModelAndView Register(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		long mobilenumber = Long.parseLong(request.getParameter("mobile"));
		FlbService.Register(username, password, name, mobilenumber);
		ModelAndView mv = new ModelAndView();
		mv.addObject("register", "Registration Successful");
		mv.setViewName("login");
		return mv;

	}

	@RequestMapping("/transfer")
	public ModelAndView MoneyTransfer(HttpServletRequest request, HttpServletResponse response) {
		long receiveraccountno = Long.parseLong(request.getParameter("receiveraccountno"));
		String receivername = FlbService.getName(receiveraccountno);
		if (receivername.equals("Invalid")) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("Error", "Invalid Bank Account Number");
			mv.setViewName("transfer");
			return mv;
		} else {
			double amount = Double.parseDouble(request.getParameter("amount"));
			String particulars = request.getParameter("particulars");
			HttpSession session = request.getSession();
			long senderaccountno = (long) session.getAttribute("accountno");
			String sendername = (String) session.getAttribute("name");
			if(FlbService.moneyTransfer(receiveraccountno, senderaccountno, receivername, sendername, amount, particulars).equals("Insufficient")) {
				ModelAndView mv=new ModelAndView();
				mv.addObject("Error","Insufficient funds");
				mv.setViewName("transfer");
				return mv;
			}
			else {
				ModelAndView mv=new ModelAndView();
				mv.addObject("success","Transaction Successful");
				mv.setViewName("balance");
				return mv;
			}
			
		}
	}

	@RequestMapping("/deposit")
	public void depositbyBank(HttpServletRequest request, HttpServletResponse response) {
		long accountno = Long.parseLong(request.getParameter("accountno"));
		double amount = Double.parseDouble(request.getParameter("amount"));
		FlbService.depositByBank(accountno, amount);
	}
}
