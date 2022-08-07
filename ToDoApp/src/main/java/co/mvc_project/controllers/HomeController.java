package co.mvc_project.controllers;

import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.mvc_project.DAO.ToDoDAO;
import co.mvc_project.entities.ToDo;

@Controller
public class HomeController {
	
	@Autowired
	ServletContext context ;
	
	//@Autowired
	ToDoDAO todoDao;


	@RequestMapping("/home")
	public String home(Model model) {
		String str = "Home";
		model.addAttribute("name", str);
	//	List<ToDo>list = (List<ToDo>) context.getAttribute("list");
		List<ToDo>list = this.todoDao.getAll();
		model.addAttribute("todos",list);	
		return "home";
	}

	@RequestMapping("/add")
	public String addTodo(Model model) {
		ToDo t = new ToDo();
		String str1 = "Add";
		model.addAttribute("name", str1);
		model.addAttribute("todo", t); 
		return "home";
	}
	
	@RequestMapping(value="/saveTodo",method=RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") ToDo t , Model model) {
		System.out.println(t);
		t.setTodoDate(new Date());
		
		// getting the list..
//		 List<ToDo> list = (List<ToDo>) context.getAttribute("list");
//		 list.add(t);
		
		this.todoDao.save(t);
		 model.addAttribute("msg", "Successfully Added..!");
		return "home";
		
	}
    
	
}
