// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   JConnect.java

package com.fei.db;

import java.io.PrintStream;
import java.sql.*;

// Referenced classes of package com.fei.db:
//            SQL, Transaction

public class JConnect
{

    private Connection sql_conn;
    private String sDriver_Name;
    private String sURL_Param[] = {
        "jdbc_url", "UserID", "Passwd"
    };
    private String sDataBase;

    public JConnect(String sDriver, String sUrl[])
    {
        sql_conn = null;
        sDriver_Name = "sun.jdbc.odbc.JdbcOdbcDriver";
        sDataBase = null;
        if(sDriver != null && sDriver.length() > 0)
            sDriver_Name = sDriver;
        for(int i = 0; i < 3; i++)
            sURL_Param[i] = sUrl[i];

    }

    public JConnect(String sDriver, String sUrl[], String sData)
    {
        this(sDriver, sUrl);
        sDataBase = sData;
    }

    public void close()
    {
        try
        {
            if(sql_conn != null)
                sql_conn.close();
        }
        catch(Exception e1)
        {
            e1.printStackTrace();
        }
        sql_conn = null;
    }

    public synchronized void connect()
    {
        close();
        sql_conn = newConnect();
    }

    protected void finalize()
        throws Throwable
    {
        close();
    }

    public synchronized Connection getConnect()
    {
        return sql_conn;
    }

    public SQL getSQL()
    {
        return new SQL(this);
    }

    public Transaction getTrans()
    {
        return new Transaction(this);
    }

    public synchronized Connection newConnect()
    {
        Connection con = null;
        System.out.println("Try connect to dataBase....");
        try
        {
            Class.forName(sDriver_Name);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        try
        {
            con = DriverManager.getConnection(sURL_Param[0], sURL_Param[1], sURL_Param[2]);
            if(sDataBase != null && sDataBase.length() > 0)
                con.setCatalog(sDataBase);
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        System.out.println("Got connection=" + con);
        return con;
    }
}
