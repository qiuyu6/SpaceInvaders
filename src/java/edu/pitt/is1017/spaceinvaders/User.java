package edu.pitt.is1017.spaceinvaders;

import java.sql.ResultSet;

import javax.swing.JOptionPane;

public class User {
	private int userID;
	private String lastName;
	private String firstName;
	private String email;
	private String password;
	private boolean loggedIn = false;
	
	public User(int userID){
            
                
		DbUtilities db = new DbUtilities();
		String sql = "SELECT * FROM users WHERE userID = " + userID + " ; ";
		try{
			ResultSet rs = db.getResultSet(sql);
			while(rs.next()){
				this.userID = rs.getInt("userID");
				this.lastName = rs.getString("lastName");
				this.firstName = rs.getString("firstName");
				this.email = rs.getString("email");
			}
		}catch(Exception e){
			System.out.println(e);
		}
		
		
	}
	
	public User(String email, String password){
		DbUtilities db = new DbUtilities();
		String sql = "SELECT * FROM users WHERE userID = '" + email + "' and password = MD5('" + password +"')"; 
		try{
			ResultSet rs = db.getResultSet(sql);
			if (rs != null){
				while(rs.next()){
					this.userID = rs.getInt("userID");
					this.lastName = rs.getString("lastName");
					this.firstName = rs.getString("firstName");
					this.email = rs.getString("email");
					this.loggedIn = true;
					JOptionPane.showMessageDialog(null, "Login successfully!");
				}
			}else{
				this.loggedIn = false;
				JOptionPane.showMessageDialog(null, "Invalid login credentials");
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}
	
	public User(String lastName, String firstName, String email, String password){
		String sql = "INSERT into users (lastName, firstName, email, password) ";
		sql = sql + "Values('" + lastName + "', '" + firstName + "', '" + email + "', '" + password +"');";
        this.password = password;
        this.lastName = lastName;
		this.firstName = firstName;
		this.email = email;
		
	}
	
	public void saveUserInfo(){
		String sql = "UPDATE  users SET email = '" + this.email + "', lastName = '" + this.lastName + "', password ='" + this.password +"' "; 
		sql = sql + "WHERE userID = " + this.userID + ";";
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isLoggedIn() {
		return loggedIn;
	}

	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}

	public int getUserID() {
		return userID;
	}
	
	

}
