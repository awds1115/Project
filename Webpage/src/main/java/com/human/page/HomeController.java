package com.human.page;

import java.net.http.HttpRequest;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.page.Member;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	private ServletRequest session;

	@RequestMapping(value = "/", method = RequestMethod.GET,
					produces="application/json; charset=utf-8")
	public String home() {		
		return "home";
	}
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	@RequestMapping(value="/regi_check", method= RequestMethod.POST,
					produces="application/json; charset=utf-8")
	public String regi_check(HttpServletRequest hsr) {

			String name=hsr.getParameter("name");
			String gender=hsr.getParameter("gender");
			String userid=hsr.getParameter("userid");
			String passcode1=hsr.getParameter("passcode1");
//			String passcode2=hsr.getParameter("passcode2");
			String[] arinter=hsr.getParameterValues("interest");
			//interest 배열을 하나의 문자로 변환
			String interest="";
			for(int i=0; i<arinter.length; i++) {
				if(interest.equals("")) {
					interest=arinter[i];
				} else {
				interest+=","+arinter[i];
				}
			}
			Member member=sqlSession.getMapper(Member.class);
			member.insertMember(name,gender,userid,passcode1,interest);

		return "login";
	}
	@ResponseBody
	@RequestMapping(value="/login_check", method= RequestMethod.POST,
			produces="application/json; charset=utf-8")
	public String login_check(HttpServletRequest hsr) {
//		String name=hsr.getParameter("id");
//		String passcode=hsr.getParameter("pw");
		//ajax로 데이터를 불러와서 (select 로 ) 포문 안에 변수에 넣으면서 #id.val()값과 맞는지 확인(if) 동일한 값이 있으면 비밀번호 확인 맞으면 home 틀리면 alert(틀렸습니다)
		Member member=sqlSession.getMapper(Member.class);
		ArrayList<Regi> ml=member.getMemberList();
		JSONArray ja=new JSONArray();
		for(int i=0; i<ml.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id",ml.get(i).getUserid());
			jo.put("pw",ml.get(i).getPasscode());
			ja.add(jo);
		}
//		System.out.println(ja);
		return ja.toString();
	}
	@ResponseBody
	@RequestMapping(value="/login_update", method= RequestMethod.POST)
	public String login_update(HttpServletRequest hsr, HttpServletRequest request) {
		String retval="";
		try {
		String userid=hsr.getParameter("id");
//		System.out.println(userid);
		Member member=sqlSession.getMapper(Member.class);
		member.updateMember(userid);
			retval="ok";
			HttpSession session = request.getSession(true);
			session.setAttribute("userid",hsr.getParameter("id"));
		} catch(Exception e) {
			retval="fail";
		}
		
		return retval;
	}
	@RequestMapping(value="/logout_update", method= RequestMethod.POST)
	public String logout_update(HttpServletRequest hsr, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		String userid = (String) session.getAttribute("userid");
//		String userid = hsr.getParameter("userid");
		System.out.println(userid);
		Member member=sqlSession.getMapper(Member.class);
		member.deleteMember(userid);
		
		session.invalidate();
		return "home";
	}
}
