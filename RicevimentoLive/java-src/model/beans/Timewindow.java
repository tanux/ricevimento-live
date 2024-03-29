package model.beans;

// Generated 4-ott-2011 19.33.58 by Hibernate Tools 3.2.4.GA

import java.util.HashSet;
import java.util.Set;

/**
 * Timewindow generated by hbm2java
 */
public class Timewindow implements java.io.Serializable {

	private Integer id;
	private String name;
	private String window;
	private String window2;
	private Integer enabled;
	private Supervisor supervisor;
	private Set roomsupervisors = new HashSet(0);

	public Timewindow() {
	}

	public Timewindow(String name, String window, String window2) {
		this.name = name;
		this.window = window;
		this.window2 = window2;
	}

	public Timewindow(String name, String window, Set roomsupervisors, String window2) {
		this.name = name;
		this.window = window;
		this.window2 = window2;
		this.roomsupervisors = roomsupervisors;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWindow() {
		return this.window;
	}

	public void setWindow(String window) {
		this.window = window;
	}
	public void setEnabled(Integer enabled){
		this.enabled = enabled;
	}
	public Integer isEnabled(){
		return this.enabled;
	}
	public Set getRoomsupervisors() {
		return this.roomsupervisors;
	}

	public void setRoomsupervisors(Set roomsupervisors) {
		this.roomsupervisors = roomsupervisors;
	}
	public Supervisor getSupervisor(){
		return this.supervisor;
	}
	public void setSupervisor(Supervisor supervisor){
		this.supervisor = supervisor;
	}
	public String getWindow2() {
		return this.window2;
	}
	public void setWindow2(String window2) {
		this.window2 = window2;
	}
}
