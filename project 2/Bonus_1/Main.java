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
            stat.executeUpdate("CREATE TABLE bonus1(id INT, data INT);");
            stat.executeUpdate("CREATE TABLE bonus2(id INT, data INT);");
            for (int i = 1; i <= 10; i++) {
                stat.executeUpdate("INSERT INTO bonus1(id, data) VALUES('" + i + "', '0');");
                stat.executeUpdate("INSERT INTO bonus2(id, data) VALUES('" + i + "', '0');");
            }
            conn.commit();
			Thread mTh1_1 = new Thread1("1");
            Thread mTh1_2 = new Thread1("2");
            Thread mTh1_3 = new Thread1("3");
            Thread mTh1_4 = new Thread1("4");
            Thread mTh1_5 = new Thread1("5");
            Thread mTh1_6 = new Thread1("6");
            Thread mTh1_7 = new Thread1("7");
            Thread mTh1_8 = new Thread1("8");
            Thread mTh1_9 = new Thread1("9");
            Thread mTh1_10 = new Thread1("10");
            Thread mTh2_1 = new Thread2("1");
            Thread mTh2_2 = new Thread2("2");
            Thread mTh2_3 = new Thread2("3");
            Thread mTh2_4 = new Thread2("4");
            Thread mTh2_5 = new Thread2("5");
            Thread mTh2_6 = new Thread2("6");
            Thread mTh2_7 = new Thread2("7");
            Thread mTh2_8 = new Thread2("8");
            Thread mTh2_9 = new Thread2("9");
            Thread mTh2_10 = new Thread2("10");
			mTh1_1.start();
            mTh1_2.start();
            mTh1_3.start();
            mTh1_4.start();
            mTh1_5.start();
            mTh1_6.start();
            mTh1_7.start();
            mTh1_8.start();
            mTh1_9.start();
            mTh1_10.start();
            mTh2_1.start();
            mTh2_2.start();
            mTh2_3.start();
            mTh2_4.start();
            mTh2_5.start();
            mTh2_6.start();
            mTh2_7.start();
            mTh2_8.start();
            mTh2_9.start();
            mTh2_10.start();
            ResultSet rs = stat.executeQuery("SELECT * FROM bonus1;");
            System.out.println("Table bonus1:");
            while (rs.next()){
                System.out.println("id = " + rs.getString("id") + ", data = " + rs.getString("data"));
            }
            rs = stat.executeQuery("SELECT * FROM bonus2;");
            System.out.println("Table bonus2:");
            while (rs.next()){
                System.out.println("id = " + rs.getString("id") + ", data = " + rs.getString("data"));
            }
            rs.close();
            stat.executeUpdate("DROP TABLE bonus1;");
            stat.executeUpdate("DROP TABLE bonus2;");
            rs.close();
            Thread.sleep(5000);
            conn.commit();
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
            stat.executeUpdate("LOCK TABLES bonus1 WRITE;");
            Thread.sleep(1000);
			stat.executeUpdate("UPDATE bonus1 SET data = data + 1 WHERE id =" + this.name + ";");
            conn.commit();
            stat.executeUpdate("LOCK TABLES bonus2 WRITE;");
            Thread.sleep(1000);
            stat.executeUpdate("UPDATE bonus2 SET data = data + 1 WHERE id =" + this.name + ";");
            stat.executeUpdate("UNLOCK TABLES;");
        	conn.commit();
        	long endTime=System.currentTimeMillis();
			System.out.println((endTime - beginTime) + "ms used by thread 1_" + this.name);
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
            stat.executeUpdate("LOCK TABLES bonus2 WRITE;");
            Thread.sleep(1000);
            stat.executeUpdate("UPDATE bonus2 SET data = data + 1 WHERE id = " + this.name + ";");
            conn.commit();
            stat.executeUpdate("LOCK TABLES bonus1 WRITE;");
            Thread.sleep(1000);
            stat.executeUpdate("UPDATE bonus1 SET data = data + 1 WHERE id = " + this.name + ";");
            stat.executeUpdate("UNLOCK TABLES;");
            conn.commit();
            long endTime=System.currentTimeMillis();
            System.out.println((endTime - beginTime) + "ms used by thread 2_" + this.name);
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