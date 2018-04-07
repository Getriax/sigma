package com.sigma.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "group_f")
public class GroupF
{
	@Id
	Integer id;
	String name;
	@OneToMany(mappedBy = "group")
	List<Fertilizer> fertilizers = new ArrayList<>();
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
	public List<Fertilizer> getFertilizers() {
		return fertilizers;
	}
	public void setFertilizers(List<Fertilizer> fertilizers) {
		this.fertilizers = fertilizers;
	}
	
}
