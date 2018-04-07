package com.sigma.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name = "carbons")
public class Carbon
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "car_id")
	Integer id;
	@NotBlank
	String name;
	String description;
	@Column(name = "main_img")
	String mainImg;
	@ElementCollection
	Set<String> imgs = new HashSet<>();
	@NotNull
	@ManyToOne
	@JoinColumn(name = "group_id")
	GroupC group;
	float j = 0;
	
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMainImg() {
		return mainImg;
	}
	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}
	public Set<String> getImgs() {
		return imgs;
	}
	public void setImgs(Set<String> imgs) {
		this.imgs = imgs;
	}
	public GroupC getGroup() {
		return group;
	}
	public void setGroup(GroupC group) {
		this.group = group;
	}
	public float getJ() {
		return j;
	}
	public void setJ(Float j) {
		this.j = j;
	}
	
}
