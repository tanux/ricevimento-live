package model.beans;

// Generated 4-ott-2011 19.33.58 by Hibernate Tools 3.2.4.GA

/**
 * Roomsupervisor generated by hbm2java
 */
public class Roomsupervisor implements java.io.Serializable {

	private Integer id;
	private Timewindow timewindow;
	private Room room;
	private Supervisor supervisor;
	private String name;

	public Roomsupervisor() {
	}

	public Roomsupervisor(Timewindow timewindow, Room room,
			Supervisor supervisor, String name) {
		this.timewindow = timewindow;
		this.room = room;
		this.supervisor = supervisor;
		this.name = name;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timewindow getTimewindow() {
		return this.timewindow;
	}

	public void setTimewindow(Timewindow timewindow) {
		this.timewindow = timewindow;
	}

	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Supervisor getSupervisor() {
		return this.supervisor;
	}

	public void setSupervisor(Supervisor supervisor) {
		this.supervisor = supervisor;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
}