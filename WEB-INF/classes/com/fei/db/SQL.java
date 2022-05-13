// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   SQL.java

package com.fei.db;

import java.io.PrintStream;
import java.sql.*;
import java.util.Vector;

// Referenced classes of package com.fei.db:
//            JResult, JConnect, JFactory

public class SQL
{

    protected JConnect jconnect;
    protected Statement sqlStmt;
    protected boolean bInTrans;
    protected boolean bLastFailed;

    protected SQL(JConnect con)
    {
        jconnect = null;
        sqlStmt = null;
        bInTrans = false;
        bLastFailed = false;
        jconnect = con;
    }

    public static synchronized String a2u(String s)
    {
        if(s == null || s.length() == 0)
            return s;
        byte b[] = s.getBytes("ISO8859_1");
        return new String(b);
        Exception e;
        e;
        e.printStackTrace();
        return s;
    }

    public void close()
    {
        closeStatement();
        jconnect.close();
    }

    protected void closeStatement()
    {
        if(sqlStmt == null)
            return;
        try
        {
            sqlStmt.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        sqlStmt = null;
    }

    public Connection connect()
    {
        Connection c = getConnect();
        boolean bNew = false;
        if(c == null)
            bNew = true;
        else
            try
            {
                if(c.isClosed())
                    bNew = true;
            }
            catch(Exception _ex)
            {
                bNew = true;
            }
        if(bNew)
        {
            jconnect.close();
            jconnect.connect();
        }
        return jconnect.getConnect();
    }

    public Connection getConnect()
    {
        return jconnect.getConnect();
    }

    public JConnect getJConnect()
    {
        return jconnect;
    }

    public JResult getResult(ResultSet rset, int iFrom, int iTo)
    {
        JResult ret;
        int iCols = 0;
        int iRows = 0;
        int iSkip = 0;
        Vector vData = new Vector();
        ResultSetMetaData rsetMD = null;
        rsetMD = rset.getMetaData();
        iCols = rsetMD.getColumnCount();
        String sColName[] = null;
        if(iCols > 0)
        {
            sColName = new String[iCols];
            for(int i = 0; i < iCols; i++)
                sColName[i] = rsetMD.getColumnName(i + 1);

        }
        int iTotal = 0;
        if(iCols > 0)
label0:
            do
            {
label1:
                do
                {
                    while(rset.next()) 
                    {
                        iTotal++;
                        if(iFrom < 0 || iFrom <= iSkip)
                            continue label1;
                        iSkip++;
                    }
                    break label0;
                } while(iTo >= 0 && iSkip >= iTo);
                iSkip++;
                iRows++;
                int i = 1;
                while(i <= iCols) 
                {
                    String sTmp;
                    try
                    {
                        sTmp = rset.getString(i);
                    }
                    catch(Exception _ex)
                    {
                        sTmp = null;
                    }
                    vData.addElement(sTmp);
                    i++;
                }
            } while(true);
        ret = new JResult(vData, iRows, iCols);
        ret.setColName(sColName);
        ret.setTotal(iTotal);
        return ret;
        Exception e;
        e;
        e.printStackTrace();
        return null;
    }

    public static void main(String args[])
    {
        JConnect jcon = JFactory.getJCon(args[0]);
        SQL db = jcon.getSQL();
        JResult jr = db.select("select * from " + args[1]);
        String s[] = jr.getColName();
        for(int i = 0; i < s.length; i++)
            System.out.print(s[i] + " , ");

        for(int i = 0; i < jr.getRows(); i++)
        {
            System.out.print("\r\n" + i + "\t");
            for(int k = 0; k < jr.getCols(); k++)
                System.out.print("," + jr.get(i, k));

        }

    }

    public CallableStatement newCalls(String sql)
    {
        Connection c;
        c = getConnect();
        if(!bInTrans && (c == null || bLastFailed))
        {
            jconnect.connect();
            c = getConnect();
        }
        CallableStatement s;
        s = c.prepareCall(sql);
        if(s != null)
            bLastFailed = false;
        return s;
        Exception e;
        e;
        e.printStackTrace();
        bLastFailed = true;
        return null;
    }

    public Statement newStatement()
    {
        closeStatement();
        Connection c = getConnect();
        if(!bInTrans && (c == null || bLastFailed))
        {
            jconnect.connect();
            c = getConnect();
        }
        try
        {
            sqlStmt = c.createStatement();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        if(sqlStmt != null)
            bLastFailed = false;
        return sqlStmt;
    }

    public synchronized ResultSet rselect(String sql)
    {
        newStatement();
        ResultSet rset = null;
        try
        {
            rset = sqlStmt.executeQuery(sql);
        }
        catch(Exception e)
        {
            System.out.println(sql);
            e.printStackTrace();
            bLastFailed = true;
        }
        return rset;
    }

    public synchronized JResult select(String sql)
    {
        newStatement();
        JResult r;
        ResultSet rset = null;
        rset = sqlStmt.executeQuery(sql);
        r = getResult(rset, -1, -1);
        closeStatement();
        return r;
        Exception e;
        e;
        System.out.println(sql);
        e.printStackTrace();
        bLastFailed = true;
        return null;
    }

    public synchronized JResult select(String sql, int iPageNo, int iPageLen)
    {
        newStatement();
        int iFrom = iPageNo * iPageLen;
        int iTo = (iPageNo + 1) * iPageLen;
        JResult r;
        ResultSet rset = null;
        rset = sqlStmt.executeQuery(sql);
        r = getResult(rset, iPageNo * iPageLen, (iPageNo + 1) * iPageLen);
        closeStatement();
        return r;
        Exception e;
        e;
        System.out.println(sql);
        e.printStackTrace();
        bLastFailed = true;
        return null;
    }

    public static synchronized String u2a(String s)
    {
        if(s == null || s.length() == 0)
            return s;
        String sRet = "";
        byte b[] = s.getBytes();
        return new String(b, "ISO8859_1");
        Exception _ex;
        _ex;
        return s;
    }

    public synchronized int update(String sql)
    {
        newStatement();
        int iRows = -1;
        try
        {
            iRows = sqlStmt.executeUpdate(sql);
            closeStatement();
        }
        catch(Exception e)
        {
            System.out.println(sql);
            e.printStackTrace();
            bLastFailed = true;
        }
        return iRows;
    }
}
