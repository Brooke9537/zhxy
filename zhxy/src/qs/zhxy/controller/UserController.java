package qs.zhxy.controller;
import java.io.File;




import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import qs.zhxy.controller.UserController;
import qs.zhxy.pojo.Role;
import qs.zhxy.pojo.User;
import qs.zhxy.pojo.Book;
import qs.zhxy.service.role.RoleService;
import qs.zhxy.service.user.UserService;
import qs.zhxy.service.book.BookService;
import qs.zhxy.tools.Constants;
import qs.zhxy.tools.PageSupport;

@Controller
@RequestMapping("/user")
public class UserController{
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	@Resource
	private BookService bookService;
	
	@RequestMapping(value="/login.html")
	public String login(){
		return "login";
	}
	
	@RequestMapping(value="/dologin.html",method=RequestMethod.POST)
	public String doLogin(@RequestParam String userId,@RequestParam String userPassword,HttpServletRequest request,HttpSession session){
		//调用service方法，进行用户匹配
		int user = userService.login(userId,userPassword);
		User loginuser = userService.login_user(userId,userPassword);
		if(0 != user){//登录成功
			//放入session
			session.setAttribute(Constants.USER_SESSION, loginuser);
			//页面跳转（frame.jsp）
			if(user == 1)
				return "redirect:/user/main.html";
			return "redirect:/user/admin.html";
			//response.sendRedirect("jsp/frame.jsp");
		}else{
			return "login";
		}
	}
	public String gonggao = "测试公告";
	@RequestMapping(value="/admin.html")
	public String main_admin(HttpSession session, Map<String, Object> map){
		if(session.getAttribute(Constants.USER_SESSION) == null){
			return "redirect:/user/login.html";
		}
		map.put("gg", gonggao);
		return "/admin/frame";
	}

	@RequestMapping(value="/main.html")
	public String main_stud(HttpSession session, Map<String, Object> map){
		if(session.getAttribute(Constants.USER_SESSION) == null){
			return "redirect:/user/login.html";
		}
		map.put("gg", gonggao);
		return "/user/frame";
	}
	
	@RequestMapping(value="/logout.html")
	public String logout(HttpSession session){
		//清除session
		session.removeAttribute(Constants.USER_SESSION);
		return "login";
	}
	@RequestMapping(value="/exlogin.html",method=RequestMethod.GET)
	public String exLogin(@RequestParam String userId,@RequestParam String userPassword){
		//调用service方法，进行用户匹配
		int user = userService.login(userId,userPassword);
		if(0 == user){//登录失败
			throw new RuntimeException("用户名或者密码不正确！");
		}
		return "redirect:/user/main.html";
	}
	
	/*@ExceptionHandler(value={RuntimeException.class})
	public String handlerException(RuntimeException e,HttpServletRequest req){
		req.setAttribute("e", e);
		return "error";
	}*/
	
	@SuppressWarnings("unused")
	@RequestMapping(value="/userlist.html")
	public String getUserList(Model model,
							@RequestParam(value="queryname",required=false) String queryUserName,
							//@RequestParam(value="queryUserRole",required=false) String queryRoleId,
							@RequestParam(value="pageIndex",required=false) String pageIndex){
		int _queryRoleId = 0;		
		List<User> userList = null;
		//设置页面容量
    	int pageSize = Constants.pageSize;
    	//当前页码
    	int currentPageNo = 1;
	
		if(queryUserName == null){
			queryUserName = "";
		}
//		if(queryRoleId != null && !queryRoleId.equals("")){
//			_queryRoleId = Integer.parseInt(queryRoleId);
//		}
		
    	if(pageIndex != null){
    		try{
    			currentPageNo = Integer.valueOf(pageIndex);
    		}catch(NumberFormatException e){
    			return "redirect:/user/syserror.html";
    			//response.sendRedirect("syserror.jsp");
    		}
    	}	
    	//总数量（表）	
    	int totalCount	= userService.getUserCount(queryUserName);
    	//总页数
    	PageSupport pages=new PageSupport();
    	pages.setCurrentPageNo(currentPageNo);
    	pages.setPageSize(pageSize);
    	pages.setTotalCount(totalCount);
    	int totalPageCount = pages.getTotalPageCount();
    	//控制首页和尾页
    	if(currentPageNo < 1){
    		currentPageNo = 1;
    	}else if(currentPageNo > totalPageCount){
    		currentPageNo = totalPageCount;
    	}
		userList = userService.getUserList(queryUserName,currentPageNo,pageSize);
		model.addAttribute("userList", userList);
//		List<Role> roleList = null;
//		roleList = roleService.getRoleList();
//		model.addAttribute("roleList", roleList);
		model.addAttribute("queryUserName", queryUserName);
		//model.addAttribute("queryRoleId", queryRoleId);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPageNo", currentPageNo);
		return "userlist";
	}
	
	@RequestMapping(value="/booklist.html")
	public String getBookList(Model model,
							@RequestParam(value="queryname",required=false) String queryBookName,
							//@RequestParam(value="queryUserRole",required=false) String queryRoleId,
							@RequestParam(value="pageIndex",required=false) String pageIndex){
				
		List<Book> bookList = null;
		//设置页面容量
    	int pageSize = Constants.pageSize;
    	//当前页码
    	int currentPageNo = 1;
	
		if(queryBookName == null){
			queryBookName = "";
		}
//		if(queryRoleId != null && !queryRoleId.equals("")){
//			_queryRoleId = Integer.parseInt(queryRoleId);
//		}
		
    	if(pageIndex != null){
    		try{
    			currentPageNo = Integer.valueOf(pageIndex);
    		}catch(NumberFormatException e){
    			return "redirect:/user/syserror.html";
    			//response.sendRedirect("syserror.jsp");
    		}
    	}	
    	//总数量（表）	
    	int totalCount	= bookService.getBookCount(queryBookName);
    	//总页数
    	PageSupport pages=new PageSupport();
    	pages.setCurrentPageNo(currentPageNo);
    	pages.setPageSize(pageSize);
    	pages.setTotalCount(totalCount);
    	int totalPageCount = pages.getTotalPageCount();
    	//控制首页和尾页
    	if(currentPageNo < 1){
    		currentPageNo = 1;
    	}else if(currentPageNo > totalPageCount){
    		currentPageNo = totalPageCount;
    	}
		bookList = bookService.getBookList(queryBookName,currentPageNo,pageSize);
		model.addAttribute("bookList", bookList);
		System.out.println("name:"+bookList.get(0).getBookName());
//		List<Role> roleList = null;
//		roleList = roleService.getRoleList();
//		model.addAttribute("roleList", roleList);
		model.addAttribute("queryBookName", queryBookName);
		//model.addAttribute("queryRoleId", queryRoleId);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPageNo", currentPageNo);
		return "booklist";
	}
	
	@RequestMapping(value="/studentdating.html",method=RequestMethod.GET)
	public String dating(@ModelAttribute("user") User user) {
//		User user = userService.getUserByUserId(userId);
//		model.addAttribute(user);
		return "studentdating";
	}
	
	
	
	@RequestMapping(value="/syserror.html")
	public String sysError(){
		return "syserror";
	}
	
	@RequestMapping(value="/useradd.html",method=RequestMethod.GET)
	public String addUser(@ModelAttribute("user") User user){
		return "useradd";
	}
	
	
	
	
/*	@RequestMapping(value="/useradd.html",method=RequestMethod.GET)
	public String addUser(User user,Model model){
		model.addAttribute("user", user);
		return "useradd";
	}*/
	
	/*@RequestMapping(value="/useraddsave.html",method=RequestMethod.POST)
	public String addUserSave(User user,HttpSession session){
		user.setCreatedBy(((User)session.getAttribute(Constants.USER_SESSION)).getId());
		user.setCreationDate(new Date());
		if(userService.add(user)){
			return "redirect:/user/userlist.html";
		}//
		return "useradd";
	}*/
	
	
	@RequestMapping(value="/add.html",method=RequestMethod.GET)
	public String add(@ModelAttribute("user") User user){
		return "user/useradd";
	}
	

	
	@RequestMapping(value="/usermodify1.html",method=RequestMethod.GET)
	public String getUserById(@RequestParam String userId,Model model){
		User user = userService.getUserByUserId(userId);
		model.addAttribute(user);
		return "usermodify1";
	}
	
	@RequestMapping(value="/view/{id} ",method=RequestMethod.GET)
	public String view(@PathVariable String userId,Model model){
		User user = userService.getUserByUserId(userId);
		model.addAttribute(user);
		return "userview";
	}

//	
//	@RequestMapping(value="/usermodifysave.html",method=RequestMethod.POST)
//	public String modifyUserSave(User user,HttpSession session){
//		logger.debug("modifyUserSave userid===================== "+user.getUserId());
//		user.setModifyBy(((User)session.getAttribute(Constants.USER_SESSION)).getUserId());
//		user.setModifyDate(new Date());
//		if(userService.modify(user)){
//			return "redirect:/user/userlist.html";
//		}
//		return "usermodify";
//	}
	
	
	
	/*//单文件上传
	@RequestMapping(value="/useraddsave.html",method=RequestMethod.POST)
	public String addUserSave(User user,HttpSession session,HttpServletRequest request,
							 @RequestParam(value ="a_idPicPath", required = false) MultipartFile attach){
		String idPicPath = null;
		//判断文件是否为空
		if(!attach.isEmpty()){
			String path = request.getSession().getServletContext().getRealPath("statics"+File.separator+"uploadfiles"); 
			logger.info("uploadFile path ============== > "+path);
			String oldFileName = attach.getOriginalFilename();//原文件名
			logger.info("uploadFile oldFileName ============== > "+oldFileName);
			String prefix=FilenameUtils.getExtension(oldFileName);//原文件后缀     
	        logger.debug("uploadFile prefix============> " + prefix);
			int filesize = 500000;
			logger.debug("uploadFile size============> " + attach.getSize());
	        if(attach.getSize() >  filesize){//上传大小不得超过 500k
            	request.setAttribute("uploadFileError", " * 上传大小不得超过 500k");
	        	return "useradd";
            }else if(prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png") 
            		|| prefix.equalsIgnoreCase("jpeg") || prefix.equalsIgnoreCase("pneg")){//上传图片格式不正确
            	String fileName = System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"_Personal.jpg";  
                logger.debug("new fileName======== " + attach.getName());
                File targetFile = new File(path, fileName);  
                if(!targetFile.exists()){  
                    targetFile.mkdirs();  
                }  
                //保存  
                try {  
                	attach.transferTo(targetFile);  
                } catch (Exception e) {  
                    e.printStackTrace();  
                    request.setAttribute("uploadFileError", " * 上传失败！");
                    return "useradd";
                }  
                idPicPath = path+File.separator+fileName;
            }else{
            	request.setAttribute("uploadFileError", " * 上传图片格式不正确");
            	return "useradd";
            }
		}
		user.setCreatedBy(((User)session.getAttribute(Constants.USER_SESSION)).getId());
		user.setCreationDate(new Date());
		user.setIdPicPath(idPicPath);
		if(userService.add(user)){
			return "redirect:/user/userlist.html";
		}
		return "useradd";
	}*/
	
//	//多文件上传
//	@RequestMapping(value="/useraddsave.html",method=RequestMethod.POST)
//	public String addUserSave(User user,HttpSession session,HttpServletRequest request,
//							 @RequestParam(value ="attachs", required = false) MultipartFile[] attachs){
//		String idPicPath = null;
//		String workPicPath = null;
//		String errorInfo = null;
//		boolean flag = true;
//		String path = request.getSession().getServletContext().getRealPath("statics"+File.separator+"uploadfiles"); 
//		logger.info("uploadFile path ============== > "+path);
//		for(int i = 0;i < attachs.length ;i++){
//			MultipartFile attach = attachs[i];
//			if(!attach.isEmpty()){
//				if(i == 0){
//					errorInfo = "uploadFileError";
//				}else if(i == 1){
//					errorInfo = "uploadWpError";
//	        	}
//				String oldFileName = attach.getOriginalFilename();//原文件名
//				logger.info("uploadFile oldFileName ============== > "+oldFileName);
//				String prefix=FilenameUtils.getExtension(oldFileName);//原文件后缀     
//		        logger.debug("uploadFile prefix============> " + prefix);
//				int filesize = 500000;
//				logger.debug("uploadFile size============> " + attach.getSize());
//		        if(attach.getSize() >  filesize){//上传大小不得超过 500k
//	            	request.setAttribute(errorInfo, " * 上传大小不得超过 500k");
//	            	flag = false;
//	            }else if(prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png") 
//	            		|| prefix.equalsIgnoreCase("jpeg") || prefix.equalsIgnoreCase("pneg")){//上传图片格式不正确
//	            	String fileName = System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"_Personal.jpg";  
//	                logger.debug("new fileName======== " + attach.getName());
//	                File targetFile = new File(path, fileName);  
//	                if(!targetFile.exists()){  
//	                    targetFile.mkdirs();  
//	                }  
//	                //保存  
//	                try {  
//	                	attach.transferTo(targetFile);  
//	                } catch (Exception e) {  
//	                    e.printStackTrace();  
//	                    request.setAttribute(errorInfo, " * 上传失败！");
//	                    flag = false;
//	                }  
//	                if(i == 0){
//	                	 idPicPath = path+File.separator+fileName;
//	                }else if(i == 1){
//	                	 workPicPath = path+File.separator+fileName;
//	                }
//	                logger.debug("idPicPath: " + idPicPath);
//	                logger.debug("workPicPath: " + workPicPath);
//	                
//	            }else{
//	            	request.setAttribute(errorInfo, " * 上传图片格式不正确");
//	            	flag = false;
//	            }
//			}
//		}
//		if(flag){
//			user.setCreatedBy(((User)session.getAttribute(Constants.USER_SESSION)).getUserId());
//			user.setCreationDate(new Date());
//			user.setIdPicPath(idPicPath);
//			user.setWorkPicPath(workPicPath);
//			if(userService.add(user)){
//				return "redirect:/user/userlist.html";
//			}
//		}
//		return "useradd";
//	}
	
	/*//多文件上传
	@RequestMapping(value="/useraddsave.html",method=RequestMethod.POST)
	public String addUserSave(User user,HttpSession session,HttpServletRequest request,
							 @RequestParam(value ="a_idPicPath", required = false) MultipartFile idPicFile,
							 @RequestParam(value ="a_workPicPath", required = false) MultipartFile workPicFile){
		String idPicPath = null;
		String workPicPath = null;
		String path = request.getSession().getServletContext().getRealPath("statics"+File.separator+"uploadfiles"); 
		logger.info("uploadFile path ============== > "+path);
		
		//判断文件是否为空(证件照)
		if(!idPicFile.isEmpty()){
			String oldFileName = idPicFile.getOriginalFilename();//原文件名
			logger.info("uploadFile oldFileName ============== > "+oldFileName);
			String prefix=FilenameUtils.getExtension(oldFileName);//原文件后缀     
	        logger.debug("uploadFile prefix============> " + prefix);
			int filesize = 500000;
			logger.debug("uploadFile size============> " + idPicFile.getSize());
	        if(idPicFile.getSize() >  filesize){//上传大小不得超过 500k
            	request.setAttribute("uploadFileError", " * 上传大小不得超过 500k");
	        	return "useradd";
            }else if(prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png") 
            		|| prefix.equalsIgnoreCase("jpeg") || prefix.equalsIgnoreCase("pneg")){//上传图片格式不正确
            	String fileName = System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"_Personal.jpg";  
                logger.debug("new fileName======== " + idPicFile.getName());
                File targetFile = new File(path, fileName);  
                if(!targetFile.exists()){  
                    targetFile.mkdirs();  
                }  
                //保存  
                try {  
                	idPicFile.transferTo(targetFile);  
                } catch (Exception e) {  
                    e.printStackTrace();  
                    request.setAttribute("uploadFileError", " * 上传失败！");
                    return "useradd";
                }  
                idPicPath = path+File.separator+fileName;
            }else{
            	request.setAttribute("uploadFileError", " * 上传图片格式不正确");
            	return "useradd";
            }
		}
		
		//判断文件是否为空(工作证照)
		if(!workPicFile.isEmpty()){
			String oldFileName = workPicFile.getOriginalFilename();//原文件名
			logger.info("uploadFile oldFileName ============== > "+oldFileName);
			String prefix=FilenameUtils.getExtension(oldFileName);//原文件后缀     
	        logger.debug("uploadFile prefix============> " + prefix);
			int filesize = 500000;
			logger.debug("uploadFile size============> " + workPicFile.getSize());
	        if(workPicFile.getSize() >  filesize){//上传大小不得超过 500k
            	request.setAttribute("uploadWpError", " * 上传大小不得超过 500k");
	        	return "useradd";
            }else if(prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png") 
            		|| prefix.equalsIgnoreCase("jpeg") || prefix.equalsIgnoreCase("pneg")){//上传图片格式不正确
            	String fileName = System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"_Personal.jpg";  
                logger.debug("new fileName======== " + workPicFile.getName());
                File targetFile = new File(path, fileName);  
                if(!targetFile.exists()){  
                    targetFile.mkdirs();  
                }  
                //保存  
                try {  
                	workPicFile.transferTo(targetFile);  
                } catch (Exception e) {  
                    e.printStackTrace();  
                    request.setAttribute("uploadWpError", " * 上传失败！");
                    return "useradd";
                }  
                workPicPath = path+File.separator+fileName;
            }else{
            	request.setAttribute("uploadWpError", " * 上传图片格式不正确");
            	return "useradd";
            }
		}
		
		user.setCreatedBy(((User)session.getAttribute(Constants.USER_SESSION)).getId());
		user.setCreationDate(new Date());
		user.setIdPicPath(idPicPath);
		user.setWorkPicPath(workPicPath);
		if(userService.add(user)){
			return "redirect:/user/userlist.html";
		}
		return "useradd";
	}*/
}
