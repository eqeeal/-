// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   Transaction.java

package com.fei.db;

import java.sql.Connection;

// Referenced classes of package com.fei.db:
//            SQL, JFactory, JConnect

public class Transaction extends SQL
{

    public Transaction(JConnect jcon)
    {
        super(jcon);
        bInTrans = true;
    }

    public boolean cancel()
    {
        bInTrans = false;
        getConnect().rollback();
        getConnect().setAutoCommit(true);
        return true;
        Exception e;
        e;
        e.printStackTrace();
        return false;
    }

    public void close()
    {
        super.close();
    }

    public boolean end()
    {
        bInTrans = false;
        getConnect().commit();
        getConnect().setAutoCommit(true);
        return true;
        Exception e;
        e;
        e.printStackTrace();
        return false;
    }

    public static void main(String args[])
    {
        Transaction tra = JFactory.getJCon("ams").getTrans();
        tra.start();
        tra.update("drop table test_a");
        tra.update("create table test_a (a varchar(100))");
        tra.update("insert into test_a values ('test')");
        tra.update("insert into test_a values ('test_00001111')");
        tra.end();
    }

    public boolean start()
    {
        bInTrans = true;
        connect();
        getConnect().setAutoCommit(false);
        return true;
        Exception e;
        e;
        e.printStackTrace();
        return false;
    }
}
