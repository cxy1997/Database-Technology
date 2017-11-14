import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

public class Main {
	public static void main(String[] args) throws ClassNotFoundException{
		try {
			Thread mTh1 = new Thread1("A");
			Thread mTh2 = new Thread2("B");
			mTh1.start();
            mTh2.start();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}

class Thread1 extends Thread{
	private String name;
	public Thread1(String name) {
		this.name = name;
	}
	public void run()
	{
		Connection conn = null;
        try 
        {
        	long beginTime=System.currentTimeMillis();
        	Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/prob2","root","password");
        	conn.setAutoCommit(false);
            conn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
			Statement stat = conn.createStatement();
            stat.executeUpdate("LOCK TABLES movies READ;");
			ResultSet rs = stat.executeQuery("SELECT AVG(runtime) FROM movies WHERE year = 1963 AND runtime IS NOT NULL;");
            rs.next();
			System.out.println("AVG(runtime) = " + rs.getString("AVG(runtime)"));
            stat.executeUpdate("UNLOCK TABLES;");
			rs.close();
        	conn.commit();
        	long endTime=System.currentTimeMillis();
			System.out.println((endTime - beginTime) + "ms used by thread 1.");
    	}
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        finally
        {
        	try{
        	    if(conn!= null)
                {
        			conn.close();
        		}
        	}
        	catch (SQLException ex) {
        	    try{
                    conn.rollback();
        		}
        		catch(SQLException newex)
        		{
                    System.out.println(newex.getMessage());
        		}
        		System.out.println(ex.getMessage());
        	}
        }
	}
}

class Thread2 extends Thread{
	private String name;
	public Thread2(String name) {
		this.name = name;
	}
	public void run()
	{
		Connection conn = null;
        try 
        {
        	long beginTime=System.currentTimeMillis();
        	Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/prob2","root","password");
        	conn.setAutoCommit(false);
            conn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
			Statement stat = conn.createStatement();
            stat.executeUpdate("LOCK TABLES movies WRITE;");
			Random rand = new Random();
			for (int i = 1; i <= 100000; i++) {
        		stat.executeUpdate("INSERT INTO movies(year, runtime, title) VALUES('1963','" + rand.nextInt(100) + "', 'testJDBC');");
        		if (i % 10000 == 0) System.out.println("B: " + i);
        	}
            stat.executeUpdate("UNLOCK TABLES;");
        	conn.commit();
        	long endTime=System.currentTimeMillis();
			System.out.println((endTime - beginTime) + "ms used by thread 2.");
    	}
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        finally
        {
        	try{
        	    if(conn!= null)
                {
        			conn.close();
        		}
        	}
        	catch (SQLException ex) {
        	    try{
                    conn.rollback();
        		}
        		catch(SQLException newex)
        		{
                    System.out.println(newex.getMessage());
        		}
        		System.out.println(ex.getMessage());
        	}
        }
	}
}