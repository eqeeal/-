// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   JResult.java

package com.fei.db;

import java.io.Serializable;
import java.util.Vector;

public class JResult
    implements Serializable
{

    protected Vector cData;
    protected int iRows;
    protected int iCols;
    protected String sColName[];
    protected int iTotal;

    public JResult(Vector obj, int iRows, int iCols)
    {
        cData = null;
        this.iRows = -1;
        this.iCols = -1;
        sColName = null;
        iTotal = -1;
        if(obj != null)
            cData = obj;
        else
            cData = null;
        this.iRows = iRows;
        this.iCols = iCols;
    }

    public String get(int iRow, int iCol)
    {
        if(iRow >= iRows || iCol >= iCols || iRow * iCols + iCol >= iRows * iCols)
            return null;
        else
            return (String)cData.elementAt(iRow * iCols + iCol);
    }

    public String get(int iRow, String sName)
    {
        int iCol = getColIndex(sName);
        return get(iRow, iCol);
    }

    public int getColIndex(String sName)
    {
        if(sColName == null)
            return -1;
        for(int i = 0; i < sColName.length; i++)
            if(sColName[i].equalsIgnoreCase(sName))
                return i;

        return -1;
    }

    public String[] getColName()
    {
        return sColName;
    }

    public int getCols()
    {
        return iCols;
    }

    public int getRows()
    {
        return iRows;
    }

    public int getTotal()
    {
        return iTotal;
    }

    public String getValue(int iRow, int iCol)
    {
        return get(iRow, iCol);
    }

    public String getValue(int iRow, String sName)
    {
        return get(iRow, sName);
    }

    public void setColName(String sName[])
    {
        sColName = sName;
        if(sColName == null)
            return;
        for(int i = 0; i < sColName.length; i++)
        {
            if(sColName[i] != null)
                sColName[i] = sColName[i].trim();
            if(sColName[i] == null || sColName[i].length() == 0)
                sColName[i] = String.valueOf(i);
        }

    }

    public void setTotal(int i)
    {
        iTotal = i;
    }
}
