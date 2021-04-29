using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data.SqlTypes;
using System.Text.RegularExpressions;


public partial class UserDefinedFunctions
{

    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString ReplaceSpecial(SqlString inputtext, SqlString filter, SqlString replacewith)
    {

        string str = inputtext.ToString();
        try
        {
            string pattern = (string)filter;
            string replacement = (string)replacewith;
            Regex rgx = new Regex(pattern);
            string result = rgx.Replace(str, replacement);
            return (SqlString)result;
        }
        catch (Exception s)
        {
            return (SqlString)s.Message;
        }
    }

    public static SqlString ParseMDXParameters(SqlString inputtext)
    {

        string parameters = inputtext.ToString();
        string[] filter;
        string filterkey;
        string filtervalue;
        string result = "";
        if (parameters.Contains('['))
        {
            foreach (string x in parameters.Split('='))
            {
                try
                {
                    filter = Regex.Replace(x.Replace("&[", "["), "&[aA-zZ]+", "").Split('.');
                    filterkey = Regex.Replace(filter.GetValue(filter.Length - 2).ToString(), @"[\[\]]+", "");
                    filtervalue = Regex.Replace(filter.Last(), @"[\[\]]+", "");
                    if (!filterkey.Contains(filtervalue) && filtervalue != "All")
                    {
                        result += filterkey + '=' + filtervalue + ';';
                    }
                }
                catch (Exception e)
                {

                }
            }
            //result = result.Remove(result.Length - 1);
        }
        else
        {
            result = parameters.Replace('&', ';');
            result = result.Replace("misrad=", "Misrad Name=");
            result = result.Replace("main_unit=", "Main Unit=");
            result = result + ';';
        }
        return result;
    }

    public static SqlString GetParameterValueFromList(SqlString ParameterList, SqlString FilterName)
    {

        string paramlist = ParameterList.ToString();
        string result = "";
        int IndexOfParameterValueStart, IndexOfParameterValueEnd;

        try
        {
            if (paramlist.Contains(FilterName.ToString()))
            {
                IndexOfParameterValueStart = paramlist.IndexOf(FilterName.ToString()) + FilterName.ToString().Length + 1;
                IndexOfParameterValueEnd = paramlist.Substring(IndexOfParameterValueStart).IndexOf(';');
                result = paramlist.Substring(IndexOfParameterValueStart, IndexOfParameterValueEnd);
            }
        }
        catch (Exception s)
        {
            return (SqlString)s.Message;
        }

        return (SqlString)result.ToString();
    }
}

