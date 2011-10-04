package model.beans;

// Generated 4-ott-2011 19.33.58 by Hibernate Tools 3.2.4.GA

import java.util.HashSet;
import java.util.Set;

/**
 * Student generated by hbm2java
 */
public class Student implements java.io.Serializable {

	private Integer id;
	private String personalNumber;
	private String username;
	private String password;
	private String nome;
	private String cognome;
	private String degree;
	private String email;
	private Set bookings = new HashSet(0);

	public Student() {
	}

	public Student(String personalNumber, String username, String password,
			String nome, String cognome, String degree, String email) {
		this.personalNumber = personalNumber;
		this.username = username;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.degree = degree;
		this.email = email;
	}

	public Student(String personalNumber, String username, String password,
			String nome, String cognome, String degree, String email,
			Set bookings) {
		this.personalNumber = personalNumber;
		this.username = username;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.degree = degree;
		this.email = email;
		this.bookings = bookings;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPersonalNumber() {
		return this.personalNumber;
	}

	public void setPersonalNumber(String personalNumber) {
		this.personalNumber = personalNumber;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return this.cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getDegree() {
		return this.degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set getBookings() {
		return this.bookings;
	}

	public void setBookings(Set bookings) {
		this.bookings = bookings;
	}

}
