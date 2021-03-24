import java.util.*;
import java.io.*;

public class ConvertSimple
{
	public static void main(String[] args)
	{
		//Find correct text file
		File f = new File("script.txt");
		Scanner fileReader = null;
		try
		{
			fileReader = new Scanner(f);
		}
		catch (IOException ex)
		{
			System.out.println("File not found");
			System.exit(0);
		}
				
		//Read the file, add each line as its own string
		ArrayList<String> slist = new ArrayList<>();
		while(fileReader.hasNextLine())
		{
			slist.add(fileReader.nextLine());
		}
		
		/*For each string in arraylist, split it and look for "to_timestamp(" and "')"*/
		
		ArrayList<String> slist2 = new ArrayList<>();
		
		/*"to_timestamp(" --> deleted*/
		for(String s : slist)
		{
			String[] splitlist = s.split("to_timestamp\\(");
			s = "";
			for(String sl : splitlist)
			{
				s += sl;
			}
			slist2.add(s);
//			System.out.println(s); //Test Code
		}
		
		ArrayList<String> slist3 = new ArrayList<>();
		
		/*",'DD-MON-RR HH.MI.SSXFF AM')" --> deleted*/
		for(String s : slist2)
		{
//			String[] splitlist = s.split("\'\\)");
			String[] splitlist = s.split(",\'DD-MON-RR HH.MI.SSXFF AM\'\\)");
			s = "";
			for(String sl : splitlist)
			{
				s += sl;
			}
			slist3.add(s);
//			System.out.println(s); //Test Code
		}
		
//		ArrayList<String> slist4 = new ArrayList<>();
//		
//		/*"DATE_COURSE_COMPLETED," --> "DATE_COURSE_COMPLETED,DATE_COURSE_COMPLETED_FORMAT,"*/
//		for(String s : slist3)
//		{
//			String[] splitlist = s.split("DATE_COURSE_COMPLETED,");
//			s = "";
//			for(String sl : splitlist)
//			{
//				s += (sl + "DATE_COURSE_COMPLETED,DATE_COURSE_COMPLETED_FORMAT,");
//			}
//			slist4.add(s);
////			System.out.println(s); //Test Code
//		}
//		
//		ArrayList<String> slist5 = new ArrayList<>();
//		
//		/*"EXAM_PASS_DATE," --> "EXAM_PASS_DATE,EXAM_PASS_DATE_FORMAT,"*/
//		for(String s : slist4)
//		{
//			String[] splitlist = s.split("EXAM_PASS_DATE,");
//			s = "";
//			for(String sl : splitlist)
//			{
//				s += (sl + "EXAM_PASS_DATE,EXAM_PASS_DATE_FORMAT,");
//			}
//			slist5.add(s);
////			System.out.println(s); //Test Code
//		}
//		
//		ArrayList<String> slist6 = new ArrayList<>();
//		
//		/*"LAST_MOD_DATE," --> "LAST_MOD_DATE,LAST_MOD_DATE_FORMAT,"*/
//		for(String s : slist5)
//		{
//			String[] splitlist = s.split("LAST_MOD_DATE,");
//			s = "";
//			for(String sl : splitlist)
//			{
//				s += (sl + "LAST_MOD_DATE,LAST_MOD_DATE_FORMAT,");
//			}
//			slist6.add(s);
////			System.out.println(s); //Test Code
//		}
//		
//		ArrayList<String> slist7 = new ArrayList<>();
//		
//		/*"EXPIRATION_DATE" --> "EXPIRATION_DATE,EXPIRATION_DATE_FORMAT"*/
//		for(String s : slist6)
//		{
//			String[] splitlist = s.split("EXPIRATION_DATE");
//			s = "";
//			for(String sl : splitlist)
//			{
//				s += (sl + "EXPIRATION_DATE,EXPIRATION_DATE_FORMAT");
//			}
//			slist7.add(s);
////			System.out.println(s); //Test Code
//		}
		
		ArrayList<String> slistexport = new ArrayList<>();
		
		/*Delete everything after semicolon ";" */
		for(String s : slist3) //Whichever ArrayList is the last one goes here
		{
			String[] splitlist = s.split(";");
			s = splitlist[0] + ";";
			slistexport.add(s);
//			System.out.println(s); //Test Code
		}
		
		//Add all of the contents to an output text file
		File f2 = new File("scriptOutput.txt");
		PrintWriter out = null;
		try
		{
			out = new PrintWriter(f2);
		}
		catch (IOException ex)
		{
			System.exit(0);
		}
		
		for(String s : slistexport)
		{
			out.println(s);
		}
		out.close();
		
		System.out.println("Done, check " + f2.getName());
	}
}