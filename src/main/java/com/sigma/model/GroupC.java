package com.sigma.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "group_c")
public class GroupC 
{
	@Id
	Integer id;
	String name;
	@OneToMany(mappedBy = "group")
	List<Carbon> carbons = new ArrayList<>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Carbon> getCarbons() {
		return carbons;
	}
	public void setCarbons(List<Carbon> carbons) {
		this.carbons = carbons;
	}
	
}
