package com.flb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flb.dao.DaoFactory;
import com.flb.service.FlbService;

@Controller
public class FlbController {

	@RequestMapping("/login")
	public ModelAndView Login(HttpServletRequest request, HttpServletResponse response) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (password.equals(FlbService.checkAccountPassword(username))) {

			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			ModelAndView mv = new ModelAndView();
			mv.addObject("AccountData", FlbService.getAccountData(username));
			mv.setViewName("welcome");
			return mv;
		}

		else if (FlbService.checkAccountPassword(username).equals("InvalidUsername")) {
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
				mv.addObject("invalidPasswordCount", 4 - invalidPasswordCount);
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
		FlbService.Register(username, password, name);
		ModelAndView mv = new ModelAndView();
		mv.addObject("register", "Registration Successful");
		mv.setViewName("login");
		return mv;

	}
}
