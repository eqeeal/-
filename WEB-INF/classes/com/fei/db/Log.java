// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   Log.java

package com.fei.db;

import java.io.*;
import java.util.Date;

public class Log
{

    private static final String sFile = "cardk_log.txt";
    private static final String sNull = "NULL";
    private static final int MAX_LEN = 0xfa000;
    private static FileOutputStream fout = null;

    public Log()
    {
    }

    public static synchronized void check()
    {
        if(fout != null)
            try
            {
                fout.close();
            }
            catch(Exception _ex) { }
        File f = new File("cardk_log.txt");
        boolean b = true;
        if(f.length() > 0xfa000L)
            b = false;
        try
        {
            fout = new FileOutputStream("cardk_log.txt", b);
        }
        catch(Exception _ex) { }
    }

    public static synchronized void log(Exception e)
    {
        check();
        try
        {
            String sTime = (new Date()).toString() + "\r\n\t";
            fout.write(sTime.getBytes());
            PrintWriter po = new PrintWriter(fout);
            e.printStackTrace(po);
            fout.write(13);
            fout.write(10);
            fout.flush();
            po.close();
            fout.close();
        }
        catch(Exception e1)
        {
            e1.printStackTrace();
        }
    }

    public static synchronized void log(String s)
    {
        check();
        String sTime = (new Date()).toString() + "\r\n\t";
        try
        {
            fout.write(sTime.getBytes());
            if(s == null || s.length() == 0)
                fout.write("NULL".getBytes());
            else
                fout.write(s.getBytes());
            fout.write(13);
            fout.write(10);
            fout.flush();
            fout.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    public static void main(String args[])
    {
        log("测试的日期");
        log("测试的日期---***");
        log(new Exception("异常的日志！"));
        log("测试的日期-------");
    }

    static 
    {
        check();
    }
}
