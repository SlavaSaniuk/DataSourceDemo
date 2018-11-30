package db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class StartupConfig {

    //Class variables
    private Context ctx;
    private Context envCtx;
    private DataSource ds;

    public StartupConfig() {

        //Create context:
        try {
            ctx = new InitialContext();
            envCtx = (Context) ctx.lookup("java:comp/env");
            ds = (DataSource) envCtx.lookup("jdbc/WebDemo");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con =  this.ds.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }


}
