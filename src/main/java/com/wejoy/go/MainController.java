package com.wejoy.go;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import com.wejoy.go.model.Hobby;
import com.wejoy.go.model.Like_func;
import com.wejoy.go.model.Mem_hob;
import com.wejoy.go.model.Member;
import com.wejoy.go.model.Post;
import com.wejoy.go.model.Ps_hob;
import com.wejoy.go.model.Like_func;
import com.wejoy.go.service.MemberService;
import com.wejoy.go.service.PagingPgm;
import com.wejoy.go.service.PostService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class MainController {

	@Autowired
	private PostService ps;
	@Autowired
	private MemberService ms;
	
	@RequestMapping("/main")
	public String init() {
		return "forward:main/pageNum/1";
	}
	@RequestMapping(value= {"/main/pageNum/{pageNum}"})
	public String main(HttpSession session,@PathVariable String pageNum,Post post,Model model,Member member,String best,String dates, String MnVal)
	{
		if(dates==null || dates=="")
			dates="0";
		if (best==null || best=="") {
			best="n";
		}
		if (MnVal==null || MnVal.equals("${MnVal}")) 
			MnVal="1";
		model.addAttribute("MnVal", MnVal);
		
		String id = (String)session.getAttribute("id");
		if(id != null)
			member = ms.select(id);
		model.addAttribute("member", member);
		int rowPerPage = 9;
		if (pageNum==null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		 int total=0;
		 if(best.equals("y")) {
			 post.setDate_line(Integer.parseInt(dates));
			 total = ps.bestTotal(post);
		}else {
	     total = ps.total(post); 
		}
	     
		PagingPgm pp = new PagingPgm(total,rowPerPage,currentPage);
		int no = total - startRow + 1;
		post.setMm_id(member.getMm_id());
		post.setStartRow(startRow);
		post.setEndRow(endRow);
		List<Post> list = getList(post);
		if(best.equals("y")) {
			list = ps.getBestList(post);	
		}else {
		 list = ps.getList(post);
		}
		
		List<Hobby> list2 = ms.hobbyList();
		model.addAttribute("list", list2);
		model.addAttribute("pp", pp);
		model.addAttribute("no", no);
		model.addAttribute("main", list);
		String[] ops = {"제목","작성자","내용"};
		model.addAttribute("keyword",post.getKeyword());
		model.addAttribute("search", post.getSearch());
		model.addAttribute("hobby_id",post.getHobby_id());
		model.addAttribute("ops",ops);
		model.addAttribute("hob_id",post.getHobby_id());
		model.addAttribute("best",best);
		model.addAttribute("dates",dates);
		return "main";
		
	}
	private List<Post> getList(Post post) {
		// TODO Auto-generated method stub
		return null;
	}
	@RequestMapping("/head")
	public String head() {
		return "head";
		
	}
	
	@RequestMapping("/footer")
	public String footer() {
		return "footer";
		
	}
	
	
	@RequestMapping("/insertForm")
	public String insertForm(HttpSession session,String nm,String pageNum,Model model,String mm_id) {
		String id=(String)session.getAttribute("id");
		int ps_id=0;
		if (nm==null || nm.equals("null")) nm = null;
		if (nm != null) {
			ps_id = Integer.parseInt(nm);
		}
		List<Hobby> list = ms.hobbyList();
		model.addAttribute("list", list);
		model.addAttribute("mm_id",mm_id);
		model.addAttribute("ps_id", ps_id);
		model.addAttribute("pageNum", pageNum);
		return "insertForm";
	}
	
	@RequestMapping("/insert")
	public String insert(Post post,String pageNum, Model model,
			HttpServletRequest request,HttpSession session) throws IOException{
		String id=(String)session.getAttribute("id");
		 if(!post.getImg().isEmpty()){		
				String fname = post.getImg().getOriginalFilename();			
				String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
				String fpath = path + "\\" + fname;
				System.out.println(fpath);
				
				FileOutputStream fs = new FileOutputStream(fpath);
				fs.write(post.getImg().getBytes());
				fs.close();
				
				post.setOrigin_ig_name(fname);
			} 
	     String ip = request.getRemoteAddr();
	    
	     int number = ps.getMaxNum();
	    post.setMm_id(id);
	     post.setPs_id(number);
	     post.setLikes(0);
	     post.setDel("n");
	     post.setIp(ip);
	     
	   
	 	String[] hobby_id = request.getParameterValues("hobby");
	  	
	 	Ps_hob P_hobby = new Ps_hob();
	     if(hobby_id.length>0) {
				for(int i=0; i<hobby_id.length; i++) {
					P_hobby.setPs_id(post.getPs_id());
					P_hobby.setHobby_id(Integer.parseInt(hobby_id[i]));
					post.setHobby_id(Integer.parseInt(hobby_id[i]));
					
				}
			}
	     int result = ps.insert(post);
	     ps.insertH(P_hobby);
	     model.addAttribute("result", result);
	     model.addAttribute("pageNum", pageNum);
	     return "insert";
	}
	
	@RequestMapping("/view/ps_id/{ps_id}/pageNum/{pageNum}")
	public String view(HttpSession session,@PathVariable int ps_id,
			@PathVariable String pageNum, Model model) {
		String id = (String)session.getAttribute("id");

		
		Post post = ps.select(ps_id);
		ps.updateReadCount(ps_id);

		
		model.addAttribute("id",id);
		model.addAttribute("post", post);
		model.addAttribute("pageNum", pageNum);
		return "view";
	}
	

	@RequestMapping("/view2")
	public void view2(HttpSession session,Model model, int ps_id,String id) {
		System.out.println("들어갓습니다!!");
		Like_func like = new Like_func();
		like.setMm_id(id);
		like.setPs_id(ps_id);
		String mm_id=ms.getId(like);
		if(mm_id ==null)
		{
			int result= ms.like(like);
			ps.likeCount(ps_id);
		}
	
	}
	
	
	
	
@RequestMapping("/updateForm/num/{num}/pageNum/{pageNum}")
	public String updateForm(HttpSession session,@PathVariable int num,
			@PathVariable String pageNum,Model model) {
		System.out.println("pageNum up ="+pageNum);
		Post post = ps.select(num);
		List<Hobby> list = ms.hobbyList();
		model.addAttribute("list", list);
		model.addAttribute("post", post);
		model.addAttribute("pageNum", pageNum);
		return "updateForm";
	}
	
@RequestMapping("/update")
	public String update(HttpSession session,Post post,String pageNum, Model model,
			HttpServletRequest request) throws IOException {
	String id = (String)session.getAttribute("id");
	
	 if(!post.getImg().isEmpty()){		
			String fname = post.getImg().getOriginalFilename();			
			String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
			String fpath = path + "\\" + fname;
			System.out.println(fpath);
			
			FileOutputStream fs = new FileOutputStream(fpath);
			fs.write(post.getImg().getBytes());
			fs.close();
			
			post.setOrigin_ig_name(fname);
		} 
		
		int result = ps.update(post);
	
		String[] hobby_id = request.getParameterValues("hobby");
	 	
	     if(hobby_id.length>0) {
				for(int i=0; i<hobby_id.length; i++) {
					Ps_hob P_hobby = new Ps_hob();
					P_hobby.setPs_id(post.getPs_id());
					P_hobby.setHobby_id(Integer.parseInt(hobby_id[i]));
					System.out.println("ps_id="+P_hobby.getPs_id());
					System.out.println("hobby_id="+P_hobby.getHobby_id());
					ps.updateH(P_hobby);
				}
			}

		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);	
		return "update";
	}
	
	@RequestMapping("/delete/ps_id/{ps_id}/pageNum/{pageNum}")
	public String delete(HttpSession session,@PathVariable int ps_id,@PathVariable String pageNum, Model model) {
		String id = (String)session.getAttribute("id");
		int result = ps.delete(ps_id);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "delete";
	}
	
	@RequestMapping("/myPage/pageNum/{pageNum}")
	public String myPage( HttpSession session,@PathVariable String pageNum,Model model)
	{	
		String id = (String)session.getAttribute("id");
		if(id==null) {
			model.addAttribute("result","1");
			return "myPage";
		}
		
		Post post=new Post();
		if (pageNum==null || pageNum.equals(""))
		pageNum = "1";		
		int rowPerPage = 5;

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		List<Post> list = ps.getPage(id);
		int total = list.size();
		PagingPgm pp = new PagingPgm(total,rowPerPage,currentPage);
		int no = total - startRow + 1;
		post.setStartRow(startRow);
		post.setMm_id(id);
		post.setEndRow(endRow);	
		List<Post> list2 = ps.getPage2(post);
		Member member = ms.select(id);
		
		
		model.addAttribute("member",member);
		model.addAttribute("pp", pp);
		model.addAttribute("no", no);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("list",list2);
		model.addAttribute("mm_id",id);
		
		return "myPage";
		
	}
	
}
