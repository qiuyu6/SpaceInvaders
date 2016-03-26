package edu.pitt.is1017.spaceinvaders;

import java.sql.ResultSet;

import java.util.UUID;

import javax.swing.JOptionPane;

public class ScoreTracker {
	private static User user;
	private static int currentScore;
	private int highestScore;
	private static String gameID;
	
	public ScoreTracker(User user){
		this.user = user;
		this.currentScore = 0;
		this.gameID = UUID.randomUUID().toString();
		DbUtilities db = new DbUtilities();
		String sql = "select max(scoreValue) as highestScore from finalscores where fk_userID = " + user.getUserID() +";";
		try{
			ResultSet rs = db.getResultSet(sql);
			this.highestScore = rs.getInt("highestScore");
			db.closeConnection(sql);
		}catch(Exception ex){
			System.out.println(ex);
		}
		
	}
	
	public static void recordScore(int point){
		DbUtilities db = new DbUtilities();
		String sql = "select * from runningscores where fk_userID = " + user.getUserID() +";";
		try{
			ResultSet rs = db.getResultSet(sql);
			currentScore = rs.getInt("scoreValue");
			db.closeConnection(sql);
		}catch(Exception ex){
			System.out.println(ex);
		}
		
		if(point == 1){
			currentScore++;			
		}else if(point == -1){
			currentScore--;			
		}else{
			System.out.print("Invalid point");
		}
		
		String sqlInsert = "update runningscores set scoreValue = " + currentScore +  "where gameID = " + ScoreTracker.gameID + ";";
		db.executeQuery(sqlInsert);
		
	}
	
	public static void recordFinalScore(){
		
		DbUtilities db = new DbUtilities();
		String sqlTwo = "INSERT INTO finalscores SELECT scoreID, gameID, scoreType, scoreValue, fk_userID, dataTimeEntered from runningscores where gameID = " + ScoreTracker.gameID + ";";
		db.executeQuery(sqlTwo);
	}

	public int getCurrentScore() {
		return currentScore;
	}

	public int getHighestScore() {
		return highestScore;
	}

	public String getGameID() {
		return gameID;
	}
	
	

}
