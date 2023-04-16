package com.skilldistillery.onepiece.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="show_character")
public class ShowCharacter {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="first_name")
	private String firstName;
	@Column(name="last_name")
	private String lastName;
	@Column(name="image_url")
	private String imageUrl;
	private Integer age;
	@UpdateTimestamp
	@Column(name="last_updated")
	private LocalDateTime lastUpdated;
	@CreationTimestamp
	@Column(name="date_added")
	private LocalDateTime dateAdded;
//	@Column(name="devil_fruit")
//	private Integer devilFruit;
//	@Column(name="organization_id")
//	private Integer organizationId;
	
	public ShowCharacter() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public LocalDateTime getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(LocalDateTime lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public LocalDateTime getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(LocalDateTime dateAdded) {
		this.dateAdded = dateAdded;
	}

//	public Integer getDevilFruit() {
//		return devilFruit;
//	}
//
//	public void setDevilFruit(Integer devilFruit) {
//		this.devilFruit = devilFruit;
//	}
//
//	public Integer getOrganizationId() {
//		return organizationId;
//	}
//
//	public void setOrganizationId(Integer organizationId) {
//		this.organizationId = organizationId;
//	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShowCharacter other = (ShowCharacter) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ShowCharacter [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", imageUrl="
				+ imageUrl + ", age=" + age + ", lastUpdated=" + lastUpdated + ", dateAdded=" + dateAdded;
	}
	
	
	
}
