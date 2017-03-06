package com.count;

import java.util.Scanner;

public class WordCount {

	private static int max(String input){
		int max = 0;
		String[] sentences = input.split("[?|.|!]");
		for (String sentence : sentences) {
			
			String[] words = sentence.trim().split(" ");
			if(words.length > max)
				max = words.length;
		}
		return max;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Enter the line: ");
		Scanner sc = new Scanner(System.in);
		String input = sc.nextLine();
		int maximum = max(input);
		System.out.println("max words in a line are: "+maximum);
	}

}
