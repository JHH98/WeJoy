package com.wejoy.go;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wejoy.go.model.Comments;
import com.wejoy.go.model.Post;
import com.wejoy.go.service.CommentsService;
import com.wejoy.go.service.PostService;


@Controller
public class CommentsController{
	@Autowired
	private CommentsService css;
	@Autowired
	private PostService ps;
	@RequestMapping("/clist/num/{num}")
	public String clist(HttpSession session,@PathVariable int num,String st,String ed, Model model) {
		String id = (String)session.getAttribute("id");
		if(st==null || st.equals(""))
		{
			st="1";
		}
		if(ed==null || ed.equals(""))
		{
			ed="10";
		}
		int start=Integer.parseInt(st);
		int end=Integer.parseInt(ed);

		System.out.println("start:"+start);
		System.out.println("end:"+end);

		Post post = ps.select(num);
		List<Comments> clist = css.list(num);
		if(end>=clist.size()) {
			end=clist.size();
		}
		
		
		model.addAttribute("id",id);
		model.addAttribute("post", post);
		model.addAttribute("clist", clist);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		return "clist";
	}
	@RequestMapping("/cInsert")
	public String cInsert(Comments cs, Model model) {
		css.insert(cs);
		return "redirect:/clist/num/"+cs.getPno();
	}
	@RequestMapping("/cDelete")
	public String cDelete(Comments cs, Model model) {
		css.delete(cs.getCno());
		return "redirect:/clist/num/"+cs.getPno();
	}
	@RequestMapping("/cUpdate")
	public String cUpdate(Comments cs, Model model) {
		css.update(cs);
		return "redirect:/clist/num/"+cs.getPno();
	}
}
