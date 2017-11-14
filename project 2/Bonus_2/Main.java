import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

public class Main {
	public static void main(String[] args) throws ClassNotFoundException{
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/prob2","root","password");
            conn.setAutoCommit(false);
            conn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);

            Statement stat = conn.createStatement();
            stat.executeUpdate("CREATE TABLE bonus(data INT);");
            stat.executeUpdate("INSERT INTO bonus(data) VALUES('0');");
            conn.commit();
            int ios = 4;
            int lock = 4;
			Thread mTh1_1 = new Thread1(1, ios, lock);
            Thread mTh1_2 = new Thread1(2, ios, lock);
            Thread mTh1_3 = new Thread1(3, ios, lock);
            Thread mTh2_1 = new Thread2(1, ios, lock);
            Thread mTh2_2 = new Thread2(2, ios, lock);
            Thread mTh2_3 = new Thread2(3, ios, lock);
            Thread mTh2_4 = new Thread2(4, ios, lock);
            Thread mTh2_5 = new Thread2(5, ios, lock);
			mTh1_1.start();
            mTh1_2.start();
            mTh1_3.start();
            mTh2_1.start();
            mTh2_2.start();
            mTh2_3.start();
            mTh2_4.start();
            mTh2_5.start();
            Thread.sleep(5000);
            stat.executeUpdate("DROP TABLE bonus;");
            conn.commit();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}

class Thread1 extends Thread{
    private int id, iso, lock;
	public Thread1(int id, int iso, int lock) {
        this.id = id;
		this.iso = iso;
        this.lock = lock;
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
            if (this.iso == 1)
                conn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
            else if (this.iso == 2)
                conn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            else if (this.iso ==  3)
                conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
            else if (this.iso == 4)
                conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);

            Statement stat = conn.createStatement();

            for (int i = 0; i < 5; i++)
            {
                Thread.sleep(1000);
                if (this.lock == 1)
                    stat.execute("LOCK TABLES bonus READ;");
                else if (this.lock == 2)
                    stat.execute("LOCK TABLES bonus WRITE;");
                ResultSet rs;
                if (this.lock == 3)
                    rs = stat.executeQuery("SELECT data FROM bonus For Update;");
                else if(this.lock == 4)
                    rs = stat.executeQuery("SELECT data FROM bonus LOCK IN SHARE MODE;");
                else
                    rs = stat.executeQuery("SELECT data FROM bonus;");
                Thread.sleep(1000);
                if (this.lock == 1)
                    stat.execute("UNLOCK TABLES;");
                else if (this.lock == 2)
                    stat.execute("UNLOCK TABLES;");
                rs.next();
                System.out.println("data = " + rs.getString("data"));
                rs.close();
            }

        	conn.commit();
        	long endTime=System.currentTimeMillis();
			System.out.println((endTime - beginTime) + "ms used by thread 1_" + this.id);
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
    private int id, iso, lock;
    public Thread2(int id, int iso, int lock) {
        this.id = id;
        this.iso = iso;
        this.lock = lock;
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
            if (this.iso == 1)
                conn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
            else if (this.iso == 2)
                conn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            else if (this.iso ==  3)
                conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
            else if (this.iso == 4)
                conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);

            Statement stat = conn.createStatement();

            for (int i = 0; i < 5; i++)
            {
                Thread.sleep(1000);
                if (this.lock == 1)
                    stat.execute("LOCK TABLES bonus READ;");
                else if (this.lock == 2)
                    stat.execute("LOCK TABLES bonus WRITE;");
                stat.executeUpdate("UPDATE bonus SET data = data + 1;");
                Thread.sleep(1000);
                if (this.lock == 1)
                    stat.execute("UNLOCK TABLES;");
                else if (this.lock == 2)
                    stat.execute("UNLOCK TABLES;");
            }
            conn.commit();
            long endTime=System.currentTimeMillis();
            System.out.println((endTime - beginTime) + "ms used by thread 2_" + this.id);
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