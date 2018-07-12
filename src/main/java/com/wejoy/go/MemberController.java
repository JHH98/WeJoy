package com.wejoy.go;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wejoy.go.model.Hobby;
import com.wejoy.go.model.Mem_hob;
import com.wejoy.go.model.Member;
import com.wejoy.go.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService ms;
	@RequestMapping("/SignUpForm")
	public String SignUpForm(Model model) {
		List<Hobby> list = ms.hobbyList();
		model.addAttribute("list", list);
		return "SignUpForm";
	}
	@RequestMapping("/SignUp")
	public String SignUp(Member member, HttpServletRequest request,Model model) {
		String[] hobby_id = request.getParameterValues("hobby_id");
		int result = ms.SignUp1(member);
		Mem_hob M_hobby = new Mem_hob();
		if(hobby_id.length>0) {
			for(int i=0; i<hobby_id.length; i++) {
				M_hobby.setMm_id(member.getMm_id());
				M_hobby.setHobby_id(Integer.parseInt(hobby_id[i]));
				int result2 = ms.SignUp2(M_hobby);
			}
		}
		model.addAttribute("result", result);
		return "SignUp";
	}
	
	@RequestMapping("/idChk")
    public String idcheck(String mm_id, Model model) {
        
		Member mb = ms.select(mm_id);
        if(mb==null) {
        	model.addAttribute("msg","사용가능한 아이디입니다.");
        }
        else {
        	model.addAttribute("msg","이미 존재하는 아이디입니다.");
        }
        return "Chk";
    }
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	@RequestMapping("/login")
	public String login(Member member, Model model, HttpSession session) {
		Member mb = ms.select(member.getMm_id());
		int result = 0;
		if (mb == null) result = -1;
		else if(mb.getDel().equals("y")) {
			result = -2;
		}
		else if (mb.getPassword().equals(member.getPassword())) {
			result = 1;
			session.setAttribute("id", member.getMm_id());  
		}
		model.addAttribute("result",result);
		return "login";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "logout";
	}
	
	@RequestMapping("/withdrawForm/mm_id/{mm_id}")
	public String  withdrawForm(Model model,@PathVariable String mm_id){
		Member member = ms.select(mm_id);
		model.addAttribute("mm_id",mm_id);
		model.addAttribute("member",member);
		return "withdrawForm";
	}
	
	@RequestMapping("/withdraw/mm_id/{mm_id}")
	public String withdraw(Model model, @PathVariable String mm_id,HttpSession session)
	{
		
		ms.withdraw(mm_id);
		session.invalidate();
		return "withdraw";
	}
	
	
	@RequestMapping("editinfoForm/mm_id/{mm_id}")
	public String editinfo(Model model,@PathVariable String mm_id){
		System.out.println("mm_id:"+mm_id);
		Member member = ms.select(mm_id);
		List<Hobby> list = ms.hobbyList();
		//mem_hob
		List<Mem_hob> mem_hob_list = ms.findMemHobes(member.getMm_id());
		//member
		model.addAttribute("mem_hob_list",mem_hob_list);
		model.addAttribute("member",member);
		model.addAttribute("list", list);
		return "editinfoForm";
	}
	
	@RequestMapping("/editinfo")
	public String editinfo(Member member, HttpServletRequest request,Model model) {
		System.out.println("mem1:"+member.getMm_id());
		System.out.println("mem1:"+member.getName());
		System.out.println("mem1:"+member.getPassword());
		String[] hobby_id = request.getParameterValues("hobby_id");
		ms.Update1(member);
		Mem_hob M_hobby = new Mem_hob();
		if(hobby_id.length>0) {
			ms.delete(member.getMm_id());
			for(int i=0; i<hobby_id.length; i++) {
				M_hobby.setMm_id(member.getMm_id());
				M_hobby.setHobby_id(Integer.parseInt(hobby_id[i]));
				
				int result2 = ms.SignUp2(M_hobby);
			}
		}
		return "editinfo";
	}
	
	@RequestMapping("/findIdForm")
	public String  findIdForm() {
		return "findIdForm";
	}
	@RequestMapping("/findId")
	public String findId(Member member, Model model) {
		String mm_id = ms.findId(member);
		int result = 0;
		if(mm_id == null) { 
			result = -1;
		}
		model.addAttribute("mm_id", mm_id);
		model.addAttribute("result", result);
		return "findId";
	}
	@RequestMapping("/SendPwd")
	public String findId() {
		return "SendPwd";
	}
	
	
	@RequestMapping("/sendMail")
	public String mail(HttpServletRequest request, Member member, Model model) {
		String mm_id = member.getMm_id();
		Member mb = ms.select(mm_id);
		if(mb != null) {
			String pw="";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() *26) +97);
			}
			 { 
				String setfrom = "leohan6540@gmail.com";         
			    String email   = member.getEmail();     // 받는 사람 이메일
			    System.out.println("이메일1"+email);
			    System.out.println("메일2"+member.getEmail());
			    String title   = "임시비밀번호";      // 제목
			    String content = "새로발급된 임시비밀번호는 '" + pw +"' 입니다."
			    		+ " 새로운 비밀번호로 수정해주시길 바랍니다.";   // 내용
			    member.setPassword(pw);
			    ms.update_pw(member);
			    //비밀번호 변경

			    try {
			      MimeMessage message = mailSender.createMimeMessage();
			      MimeMessageHelper messageHelper 
			                        = new MimeMessageHelper(message, true, "UTF-8");
			      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			      messageHelper.setTo(email);     // 받는사람 이메일
			      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			      messageHelper.setText(content);  // 메일 내용
			     
			      mailSender.send(message);
			    } catch(Exception e){
			      System.out.println(e);
			    }
			}
		}
		else{ 
			model.addAttribute("msg","아이디 또는 이메일이 잘못됬습니다.");
			return "Chk";
			}
	    return "main";
	}
	
}
