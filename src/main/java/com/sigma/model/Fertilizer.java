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
@Table(name = "fertilizers")
public class Fertilizer
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "fer_id")
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
	GroupF group;
	//Pierwiastki jakie zawiera
	
	float p = 0;
	float n = 0;
	float k = 0;
	float mg = 0;
	float ca = 0;
	float s = 0;
	
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
	public GroupF getGroup() {
		return group;
	}
	public void setGroup(GroupF group) {
		this.group = group;
	}
	public float getP() {
		return p;
	}
	public void setP(float p) {
		this.p = p;
	}
	public float getN() {
		return n;
	}
	public void setN(float n) {
		this.n = n;
	}
	public float getK() {
		return k;
	}
	public void setK(float k) {
		this.k = k;
	}
	public float getMg() {
		return mg;
	}
	public void setMg(float mg) {
		this.mg = mg;
	}
	public float getCa() {
		return ca;
	}
	public void setCa(float ca) {
		this.ca = ca;
	}
	public float getS() {
		return s;
	}
	public void setS(float s) {
		this.s = s;
	}
	
	
}
