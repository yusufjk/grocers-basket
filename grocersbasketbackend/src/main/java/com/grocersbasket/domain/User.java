
package com.grocersbasket.domain;



import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="User")
public class User implements Serializable{
	    
	    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		@Id
	    @Email
		private String uemail; 
	   
		@NotBlank(message="Please enter your first name!")
	    @Column(unique=true)
		private String firstName;
	    
		@NotBlank(message="Please enter your last name!")
		private String lastName;
	    
		@NotBlank(message="Please enter your phone number!")
		@Column(name="phone_number")
	    private String phoneNumber;
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
		public String getPhoneNumber() {
			return phoneNumber;
		}
		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}

		@NotNull
	    @Size(min=1, max=100,message="user password should be between 1 to 30 characters long")
	    private String upassword;
	    
		@Transient
		private String confirmPassword;
		
		public String getConfirmPassword() {
			return confirmPassword;
		}
		public void setConfirmPassword(String confirmPassword) {
			this.confirmPassword = confirmPassword;
		}

		private String role;
		
		public  String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		public String getUemail() {
			return uemail;
		}
		public void setUemail(String uemail) {
			this.uemail = uemail;
		}
		
		
		@OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
		private Cart cart;
		
		public Cart getCart() {
			return cart;
		}
		public void setCart(Cart cart) {
			this.cart = cart;
		}
		
		public String getUpassword() {
			return upassword;
		}
		public void setUpassword(String upassword) {
			this.upassword = upassword;
		}
		
		
	
		
		
}

