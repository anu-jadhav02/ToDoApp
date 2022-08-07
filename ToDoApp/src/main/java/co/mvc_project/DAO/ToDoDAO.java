package co.mvc_project.DAO;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import co.mvc_project.entities.ToDo;

public class ToDoDAO {
	
	@Autowired
HibernateTemplate hibernateTemplate ;
	
	//@Autowired
	@Transactional
	public int save(ToDo t) {
		Integer i = (Integer) this.hibernateTemplate.save(t);
		return i;
	}
	
	public List<ToDo> getAll(){
		List<ToDo> j = this.hibernateTemplate.loadAll(ToDo.class);
		return j;
		
	}
}
