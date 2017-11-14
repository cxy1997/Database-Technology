import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

public class Main {
	public static void main(String[] args) throws ClassNotFoundException{
		try {
            Thread mTh2 = new Thread2("C");
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
            conn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
            Statement stat = conn.createStatement();
            Random rand = new Random();
            stat.executeUpdate("ALTER TABLE ratings ADD PRIMARY KEY (movie_id);");
            stat.executeUpdate("ALTER TABLE preserve ADD PRIMARY KEY (id);");
            //stat.executeUpdate("DROP TABLE preserve;");
            //stat.executeUpdate("CREATE TABLE preserve AS (SELECT * FROM movies WHERE year >= 2016 and id IN (SELECT movie_id FROM ratings WHERE rating > 6.0));");
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
            conn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
            Statement stat = conn.createStatement();
            Random rand = new Random();
            stat.executeUpdate("INSERT INTO movies SELECT * FROM preserve;");
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
class Thread3 extends Thread{
    private String name;
    public Thread3(String name) {
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
            conn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
            Statement stat = conn.createStatement();
            Random rand = new Random();
            stat.executeUpdate("DELETE FROM movies WHERE title = 'testJDBC';");
            conn.commit();
            long endTime=System.currentTimeMillis();
            System.out.println((endTime - beginTime) + "ms used by thread 3.");
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