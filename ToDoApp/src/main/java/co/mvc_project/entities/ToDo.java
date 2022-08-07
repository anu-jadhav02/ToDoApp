package co.mvc_project.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class ToDo {
	@Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int todoId;
	private String todoTitle;
	private String todoContent;
	private Date todoDate;
	public ToDo(String todoTitle, String todoContent, Date todoDate) {
		// super();
		this.todoTitle = todoTitle;
		this.todoContent = todoContent;
		this.todoDate = todoDate;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getTodoTitle() + " : " + this.getTodoContent() ;
	}
	public ToDo() {
		// super();
		// TODO Auto-generated constructor stub
	}
	public String getTodoTitle() {
		return todoTitle;
	}
	public void setTodoTitle(String todoTitle) {
		this.todoTitle = todoTitle;
	}
	public String getTodoContent() {
		return todoContent;
	}
	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}
	public Date getTodoDate() {
		return todoDate;
	}
	public void setTodoDate(Date todoDate) {
		this.todoDate = todoDate;
	}
}
