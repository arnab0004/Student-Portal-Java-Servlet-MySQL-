package com.example.web;

import java.sql.Connection;

public class TestDB {
	
	public static void main(String[] args) {
		
		Connection con = DBConnection.getConnection();
		if(con!= null) {
			System.out.println("Success");
		}else {
			System.out.println("Fail");
		}
	}

}
