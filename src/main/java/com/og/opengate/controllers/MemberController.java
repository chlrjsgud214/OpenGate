package com.og.opengate.controllers;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.og.opengate.model.Member;
import com.og.opengate.service.MemberService;
@Controller
public class MemberController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping("joinForm")
	public String joinForm() {
		return "/member/joinForm";
	}
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String idChk(String id) {
		String data = "";
		Member member = ms.select(id);
		System.out.println("id-"+id);
		System.out.println(member);
		if(member == null) data = "사용 가능한 아이디입니다";
		else data = "사용중인 아이디입니다";
		return data;
	}
	@RequestMapping("myinfo")
	public String myinfo(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		return "/member/myinfo";
	}
	@RequestMapping("join")
	public String join(Member member, Model model) {
		int result = 0;
		Member mem = ms.select(member.getId());
		if(mem == null) result = ms.insert(member);
		else result = -1;
		model.addAttribute("result", result);
		return "/member/join";
	}
	@RequestMapping("loginForm")
	public String loginForm() {
		return "/member/loginForm";
	}
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		int result = 0;
		Member mem = ms.select(member.getId());
		if(mem == null) {
			result = -1;
		} else if (mem.getPassword().equals(member.getPassword())) {
			result = 1;
			session.setAttribute("id", member.getId());
		}
		model.addAttribute("result", result);
		return "/member/login";
	}
	@RequestMapping("updateForm")
	public String updateForm(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		return "/member/updateForm";
	}
//	@RequestMapping("update")
//	public String update(Member member, Model model) {
//		int result = ms.update(member);
//		model.addAttribute("result", result);
//		return "/member/update";
//	}
	@RequestMapping("update")
	public String update(Member member, Model model) {
		int result = 0;
		Member mem = ms.select(member.getId());
		if(mem != null) result = ms.update(member);
		else result = -1;
		model.addAttribute("result", result);
		return "/member/update";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/member/logout";
	}
	@RequestMapping("delete")
	public String delete(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		int result = ms.delete(id);
		model.addAttribute("result", result);
		return "/member/delete";
	}
}
