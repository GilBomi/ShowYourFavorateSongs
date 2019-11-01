package net.skhu.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.skhu.SendEmailSSL;
import net.skhu.TempAuth_key;
import net.skhu.domain.Board;
import net.skhu.domain.File2;
import net.skhu.domain.Post;
import net.skhu.domain.User;
import net.skhu.repository.BoardRepository;
import net.skhu.repository.File2Repository;
import net.skhu.repository.PostRepository;
import net.skhu.repository.UserRepository;

@Controller
@RequestMapping("/page")
public class APIController {
	//   @Bean
	//   public CommonsMultipartResolver multipartResolver() {
	//      CommonsMultipartResolver multipart = new CommonsMultipartResolver();
	//      multipart.setMaxUploadSize(3 * 1024 * 1024);
	//      return multipart;
	//   }
	//
	//   @Bean
	//   public MultipartFilter multipartFilter() {
	//      MultipartFilter multipartFilter = new MultipartFilter();
	//      multipartFilter.setMultipartResolverBeanName("multipartReso  lver");
	//      return multipartFilter;
	//   }

	@Autowired
	UserRepository userRepository;
	@Autowired
	BoardRepository boardRepository;
	@Autowired
	File2Repository fileRepository;
	@Autowired
	PostRepository postRepository;

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join(Model model) {
		List<User> users = userRepository.findAll();
		model.addAttribute("users", users);
		// System.out.println("갯수:"+users.size());
		return "page/join";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join2(Model model, User user) {
		String auth_key = new TempAuth_key().getKey(45, false);
		SendEmailSSL es = new SendEmailSSL();
		// if(userRepositroy.findByEmail(user.getEmail())==null
		// &&userRepositroy.findByNickname(user.getNickname())==null) {
		userRepository
		.save(new User(user.getEmail(), user.getPassword(), user.getNickname(), null, auth_key, false, false));
		es.sendEmail(user.getEmail(), auth_key); // 받는 사람 이메일
		return "redirect:joinNext";
	}

	@RequestMapping(value = "joinNext", method = RequestMethod.GET)
	public String edit(Model model) {
		int max = userRepository.findMaxUser_idx();
		Optional<User> optinalEntity = userRepository.findById(max);
		User user = optinalEntity.get();
		model.addAttribute("user", user);
		return "page/joinNext";
	}

	@RequestMapping(value = "join_success", method = RequestMethod.GET)
	public String join_success(Model model, @RequestParam("auth_key") String auth_key) {
		User user = userRepository.findByAuth_key(auth_key);
		userRepository.updateAuth_key(user.getEmail());
		return "page/join_success";
	}

	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public String findPw(Model model, User user) {
		List<User> users = userRepository.findAll();
		model.addAttribute("users", users);
		return "page/findPw";
	}

	@RequestMapping(value = "findPw", method = RequestMethod.POST)
	public String findPw2(Model model, @RequestParam("email") String email) {
		User user = userRepository.findByEmail(email);
		SendEmailSSL es = new SendEmailSSL();
		// if(userRepositroy.findByEmail(user.getEmail())==null
		// &&userRepositroy.findByNickname(user.getNickname())==null) {
		es.sendPwChange(user.getEmail(), user.getAuth_key());
		return "redirect:findPwNext";
	}

	@RequestMapping(value = "changePw", method = RequestMethod.GET)
	public String changePw(Model model, @RequestParam("auth_key") String auth_key) {
		return "page/changePw";
	}

	@RequestMapping(value = "changePw", method = RequestMethod.POST)
	public String changePw2(Model model, @RequestParam("auth_key") String auth_key,
			@RequestParam("password") String password) {
		User user = userRepository.findByAuth_key(auth_key);
		userRepository.updatePassword(user.getEmail(), password);//auth키 수정?
		return "redirect:changePwNext";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model) {
		List<User> users = userRepository.findAll();
		model.addAttribute("users", users);
		return "page/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView login2(@Valid User user, BindingResult bindingResult, HttpSession session,
			HttpServletResponse response) throws Exception {
		if (bindingResult.hasErrors()) {
			ModelAndView mv = new ModelAndView("page/login");
			return mv;
		}
		User user2 = userRepository.findByEmail(user.getEmail());
		session.setAttribute("user", user2);

		Cookie rememberCookie = new Cookie("REMEMBER", user2.getEmail());
		rememberCookie.setPath("/");
		response.addCookie(rememberCookie);
		ModelAndView mv = new ModelAndView("redirect:home");
		return mv;

	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public ModelAndView logtout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:home");
		return mv;
	}

	// @RequestMapping(value="example", method=RequestMethod.GET)
	// public String example() {
	// return "page/example";
	// }
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String list() {
		return "page/home";
	}

	@RequestMapping(value = "changePwNext", method = RequestMethod.GET)
	public String changePwNext() {
		return "page/changePwNext";
	}

	@RequestMapping(value = "searchingSong", method = RequestMethod.GET)
	public String searching() {
		return "page/searchingSong";
	}

	@RequestMapping(value = "user", method = RequestMethod.GET)
	public String user(Model model,@RequestParam("user_idx") int user_idx) {
		Optional<User> optinalEntity2=userRepository.findById(user_idx);
		User user = optinalEntity2.get();
		model.addAttribute("u",user);
		System.out.println("유저페이지~");
		return "page/user";
	}

	@RequestMapping(value = "map", method = RequestMethod.GET)
	public String map() {
		return "page/map";
	}

	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String notice(Model model,@RequestParam("pg") int pg) {
		Board board= boardRepository.findById(5).get();
		List<Post> notices_ex=board.getPosts();//게시판
//		List<Post> notices=new ArrayList<>();
//		for(int i=notices_ex.size()-1;i>=0;i--) { // date기준으로 역순으로 정렬하려고
//			notices.add(notices_ex.get(i));
//		}
		Collections.sort(notices_ex);
		model.addAttribute("pg", pg);
		model.addAttribute("notices", notices_ex);
		return "page/notice";
	}

	@RequestMapping(value = "chartBoard", method = RequestMethod.GET)
	public String chartBoard() {
		return "page/chartBoard";
	}

	@RequestMapping(value = "bestBoard", method = RequestMethod.GET)
	public String bestBoard(Model model) {
		return "page/bestBoard";
	}

	@RequestMapping(value="freeBoard", method=RequestMethod.GET)
	public String freeBoard(Model model,@RequestParam("pg") int pg) {
		Board board= boardRepository.findById(1).get();
		List<Post> freePosts_ex=board.getPosts();//게시판
//		List<Post> freePosts=new ArrayList<>();
//		for(int i=freePosts_ex.size()-1;i>=0;i--) { // date기준으로
//			freePosts.add(freePosts_ex.get(i));
//		}
		Collections.sort(freePosts_ex);
		model.addAttribute("pg",pg);
		model.addAttribute("freePosts", freePosts_ex);

		return "page/freeBoard";
	}

	//팁게시판 조회
	@RequestMapping(value="tipBoard", method=RequestMethod.GET)
	public String tipBoard(Model model,@RequestParam("pg") int pg) {
		Board board= boardRepository.findById(4).get();
		List<Post> tipPosts_ex=board.getPosts();
//		List<Post> tipPosts=new ArrayList<>();
//		for(int i=tipPosts_ex.size()-1;i>=0;i--) { // date기준으로 역순으로 정렬하려고
//			tipPosts.add(tipPosts_ex.get(i));
//		}
		Collections.sort(tipPosts_ex);
		model.addAttribute("pg",pg);
		model.addAttribute("tipPosts", tipPosts_ex);

		return "page/tipBoard";
	}

	//추천게시판
	@RequestMapping(value="recommendBoard", method=RequestMethod.GET)
	public String recommendBoard(Model model,@RequestParam("pg") int pg) {
		Board board= boardRepository.findById(3).get();
		List<Post> recomPosts_ex=board.getPosts();
//		List<Post> recomPosts=new ArrayList<>();
//		for(int i=recomPosts_ex.size()-1;i>=0;i--) { // date기준으로 역순으로 정렬하려고
//			recomPosts.add(recomPosts_ex.get(i));
//		}
		Collections.sort(recomPosts_ex);
		model.addAttribute("pg",pg);
		model.addAttribute("recomPosts", recomPosts_ex);

		return "page/recommendBoard";
	}

	//자랑게시판
	@RequestMapping(value="boastBoard", method=RequestMethod.GET)
	public String boastBoard(Model model,@RequestParam("pg") int pg) {
		Board board= boardRepository.findById(2).get();
		List<Post> boastPosts_ex=board.getPosts();
//		List<Post> boastPosts=new ArrayList<>();
//		for(int i=boastPosts_ex.size()-1;i>=0;i--) { // date기준으로 역순으로 정렬하려고
//			boastPosts.add(boastPosts_ex.get(i));
//		}
		Collections.sort(boastPosts_ex);
		model.addAttribute("pg",pg);
		model.addAttribute("boastPosts", boastPosts_ex);

		return "page/boastBoard";
	}

	@RequestMapping(value="post/{id}", method=RequestMethod.GET)
	public String postId(Model model, @PathVariable("id") int id) {
		Post post= postRepository.findById(id).get();
		List<File2> files=post.getFiles();//파일
		postRepository.updateView(id);
		int board_id=post.getBoard().getBoard_id();
		System.out.println("board_id~: "+board_id);
		model.addAttribute("selectBoard",board_id);
		model.addAttribute("post", post);
		model.addAttribute("files", files);

		return "page/post";
	}

	@RequestMapping(value = "relative", method = RequestMethod.GET)
	public String relative() {
		return "page/relative";
	}

	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findId() {
		return "page/findId";
	}

	@RequestMapping(value = "findIdNext", method = RequestMethod.GET)
	public String findIdNext() {
		return "page/findIdNext";
	}

	@RequestMapping(value = "findPwNext", method = RequestMethod.GET)
	public String findPwNext() {
		return "page/findPwNext";
	}

	//   @RequestMapping(value = "fileForm", method = RequestMethod.POST)
	//   public String fileForm2() {
	//      System.out.println("fileForm post");
	//      return "page/fileFormOK";
	//   }
	@RequestMapping(value = "fileForm", method = RequestMethod.GET)
	public String fileForm3() {
		System.out.println("fileForm post");
		return "page/fileForm";
	}

	@RequestMapping(value = "fileFormOK", method = RequestMethod.GET)
	public String fileFormOK() {
		System.out.println("fileFormOK GET");
		return "page/fileForm";
	}
	// 유저 삭제 메소드
	@RequestMapping(value = "userDelete", method = RequestMethod.GET)
	public String userDelete(Model model,@RequestParam("user_idx") int user_idx) {
		System.out.println("유저삭제입니다!");
		Optional<User> optinalEntity2 =userRepository.findById(user_idx);
		User user = optinalEntity2.get();
		userRepository.deleteById(user_idx);
		return "redirect:home";

	}

	// 글 삭제 메소드
	@RequestMapping(value = "postDelete", method = RequestMethod.GET)
	public String postDelete(Model model,@RequestParam("post_id") int post_id) {
		Optional<Post> optinalEntity2 = postRepository.findById(post_id);
		Post post = optinalEntity2.get();
		Board board=post.getBoard();
		postRepository.deleteById(post_id);
		if(board.getBoard_id()==1)
			return "redirect:freeBoard?pg=1";
		else if(board.getBoard_id()==2)
			return "redirect:boastBoard?pg=1";
		else if(board.getBoard_id()==3)
			return "redirect:recommendBoard?pg=1";
		else if(board.getBoard_id()==4)
			return "redirect:tipBoard?pg=1";
		return "redirect:notice?pg=1";

	}

	// 글 수정
	@RequestMapping(value = "postModify", method = RequestMethod.GET)
	public String postModify(Model model,@RequestParam("post_id") int post_id) {
		Optional<Post> optinalEntity2 = postRepository.findById(post_id);
		Post post = optinalEntity2.get();
		int board_id=post.getBoard().getBoard_id();
		model.addAttribute("post", post);
		List<File2> file=fileRepository.findAllByPost(post);
		model.addAttribute("files", file);
		model.addAttribute("selectBoard", board_id);
		model.addAttribute("postModify", "yes");
		// System.out.println("파일 id: "+file.get(0).getFile_id());
		return "page/postWrite";

	}
	@RequestMapping(value = "postModify", method = RequestMethod.POST)
	public String postModify2(@RequestParam("post_id") int post_id, final HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {
		int maxSize  = 1024*1024*10;

		// 웹서버 컨테이너 경로
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println("root:"+root);
		// 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
		String savePath = root + "upload/";


		// 업로드 파일명
		String uploadFile = "";

		// 실제 저장할 파일명
		String newFileName = "";

		int read = 0;
		byte[] buf = new byte[1024];
		FileInputStream fin = null;
		FileOutputStream fout = null;
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
		String title="";
		String content="";
		int user_idx=0;
		int board_id=0;
		User user = (User) session.getAttribute("user");
	      if(user==null)
	         System.out.println("nulllll");
	      else
	         System.out.println("id입니다!!!:"+user.getUser_idx());
		Board board=null;
		try{
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			// 전송받은 parameter의 한글깨짐 방지
			title = multi.getParameter("title");
			content = multi.getParameter("content");
			System.out.println("title:"+title);


//			user_idx = Integer.parseInt(multi.getParameter("user_idx"));
			System.out.println("user_idx:"+user_idx);

//			Optional<User> optinalEntity = userRepository.findById(user_idx);
//			user = optinalEntity.get();

			board_id = Integer.parseInt(multi.getParameter("board_id"));
			Optional<Board> optinalEntity2 = boardRepository.findById(board_id);
			board = optinalEntity2.get();

			//title = new String(title.getBytes("8859_1"), "UTF-8");

			//         System.out.println("board_id:"+board_id);
			Enumeration files = multi.getFileNames();

			while(files.hasMoreElements()){
				String file1 = (String)files.nextElement();

				uploadFile = multi.getOriginalFileName(file1);
				newFileName = multi.getFilesystemName(file1);

				File file = multi.getFile(file1);
			}

		} catch(Exception e){
			e.printStackTrace();
		}

		postRepository.updateByPost_id(title,content,post_id);
//		제목과 내용은 수정되는데 파일은 수정이 안되고 처음에 올린 그대로 올라감
//		if(uploadFile!=null) {
//			File2 file=new File2();
//			file.setFile_name(uploadFile);
//			file.setPost(p);
//			fileRepository.save(file);
//		}
//		System.out.println(newFileName);
//		System.out.println(uploadFile);
//		System.out.println("마지막");
//		return "redirect:/page/post/"+p.getPost_id();
		return "redirect:/page/post/"+post_id;

	}
	// 글 추가 메소드
	@RequestMapping(value = "postWrite/{board_id}", method = RequestMethod.GET)
	public String postWrite(@PathVariable("board_id") int board_id,Model model,final HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		User user = (User) session.getAttribute("user");
		Post post = new Post();
		File2 file = new File2();

		List<Board> boards = boardRepository.findAll();
		List<User> users = userRepository.findAll();

		model.addAttribute("selectBoard", board_id);
		model.addAttribute("post", post);
		model.addAttribute("boards", boards);
		model.addAttribute("users", users);
		model.addAttribute("files", file);

		return "page/postWrite";
	}

	@RequestMapping(value = "postWrite/{board_id}", method = RequestMethod.POST)
	public String postWrite(final HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("postWrite");
		// 10Mbyte 제한
		//ServletContext ctx = request.getServletContext();
		// 10Mbyte 제한
		int maxSize  = 1024*1024*10;

		// 웹서버 컨테이너 경로
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println("root:"+root);
		// 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
		String savePath = root + "upload/";

		// 업로드 파일명
		String uploadFile = "";

		// 실제 저장할 파일명
		String newFileName = "";

		int read = 0;
		byte[] buf = new byte[1024];
		FileInputStream fin = null;
		FileOutputStream fout = null;
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
		String title="";
		String content="";
		int user_idx=0;
		int board_id=0;
		User user = (User) session.getAttribute("user");
	      if(user==null)
	         System.out.println("nulllll");
	      else
	         System.out.println("id입니다!!!:"+user.getUser_idx());
		Board board=null;
		try{
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			// 전송받은 parameter의 한글깨짐 방지
			title = multi.getParameter("title");
			content = multi.getParameter("content");
			System.out.println("title:"+title);


//			user_idx = Integer.parseInt(multi.getParameter("user_idx"));
			System.out.println("user_idx:"+user_idx);

//			Optional<User> optinalEntity = userRepository.findById(user_idx);
//			user = optinalEntity.get();

			board_id = Integer.parseInt(multi.getParameter("board_id"));
			Optional<Board> optinalEntity2 = boardRepository.findById(board_id);
			board = optinalEntity2.get();

			//title = new String(title.getBytes("8859_1"), "UTF-8");

			//         System.out.println("board_id:"+board_id);
			Enumeration files = multi.getFileNames();

			while(files.hasMoreElements()){
				String file1 = (String)files.nextElement();

				uploadFile = multi.getOriginalFileName(file1);
				newFileName = multi.getFilesystemName(file1);

				File file = multi.getFile(file1);
			}

		} catch(Exception e){
			e.printStackTrace();
		}

		Post p=postRepository.save(new Post(user,board,title,content,0,new Date()));

		if(uploadFile!=null) {
			File2 file=new File2();
			file.setFile_name(uploadFile);
			file.setPost(p);
			fileRepository.save(file);
		}
		System.out.println(newFileName);
		System.out.println(uploadFile);
		System.out.println("마지막");
		return "redirect:/page/post/"+p.getPost_id();
	}

}




