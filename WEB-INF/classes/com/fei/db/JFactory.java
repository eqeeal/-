// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   JFactory.java

package com.fei.db;

import java.util.ResourceBundle;

// Referenced classes of package com.fei.db:
//            JConnect

public class JFactory
{

    private static final String CONFIG = "jdbc_set";

    public JFactory()
    {
    }

    public static synchronized JConnect getJCon()
    {
        String sUrl[] = readConfig("");
        if(sUrl == null)
        {
            return null;
        } else
        {
            JConnect jconnect = new JConnect(sUrl[3], sUrl, sUrl[4]);
            return jconnect;
        }
    }

    public static synchronized JConnect getJCon(String s)
    {
        String sUrl[] = readConfig(s);
        JConnect jconnect = new JConnect(sUrl[3], sUrl, sUrl[4]);
        return jconnect;
    }

    private static synchronized String[] readConfig(String s)
    {
        String sAdd;
        String sUrl[];
        sAdd = "";
        if(s != null && s.length() > 0)
            sAdd = "_" + s;
        sUrl = new String[5];
        ResourceBundle r = ResourceBundle.getBundle("jdbc_set");
        sUrl[0] = r.getString("db_url" + sAdd);
        sUrl[1] = r.getString("db_user" + sAdd);
        sUrl[2] = r.getString("db_passwd" + sAdd);
        sUrl[3] = r.getString("db_driver" + sAdd);
        sUrl[4] = r.getString("db_name" + sAdd);
        return sUrl;
        Exception e;
        e;
        e.printStackTrace();
        return null;
    }
}
