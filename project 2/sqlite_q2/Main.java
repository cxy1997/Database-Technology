import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
	public static void main(String[] args) throws ClassNotFoundException{
		try {
			Thread mTh1 = new Thread1("A");
			Thread mTh2 = new Thread2("B");
			mTh2.start();
			mTh1.start();
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
        	Class.forName("org.sqlite.JDBC");
        	conn = DriverManager.getConnection("jdbc:sqlite:prob1.db");
        	conn.setAutoCommit(false);
            conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery("SELECT AVG(runtime) FROM movies, ratings WHERE movies.id = ratings.movie_id and rating > 6.0 and runtime IS NOT NULL;");
			System.out.println("AVG(runtime) = " + rs.getString("AVG(runtime)"));
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
        	Class.forName("org.sqlite.JDBC");
        	conn = DriverManager.getConnection("jdbc:sqlite:prob1.db");
        	conn.setAutoCommit(false);
            conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
			Statement stat = conn.createStatement();
            stat.executeUpdate("DELETE FROM movies WHERE id IN (SELECT id FROM preserve);");
			//stat.executeUpdate("DELETE FROM movies WHERE movies.id IN tbd;");
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