using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Varigence.Biml.Extensions;
using Varigence.Languages.Biml;
using Varigence.Languages.Biml.Table;
using Varigence.Languages.Biml.FileFormat;

public static class Utilities
{

    public static string BimlDataType(string dataType, string length, string precision, string scale)
    {
        switch (dataType)
        {
            case "AnsiString":
            case "AnsiStringFixedLength":
            case "Binary":
            case "String":
            case "StringFixedLength":
                return string.Format("DataType=\"{0}\" Length=\"{1}\"", dataType, length);

            case "Decimal":
                return string.Format("DataType=\"{0}\" Precision=\"{1}\" Scale=\"{2}\"", dataType, precision, scale);

            case "Double":
            case "Single":
                return string.Format("DataType=\"{0}\" Precision=\"{1}\"", dataType, precision);

            case "DateTime2":
            case "DateTimeOffset":
            case "Time":
                return string.Format("DataType=\"{0}\" Scale=\"{1}\"", dataType, scale);
        }
        return string.Format("DataType=\"{0}\"", dataType);
    }

    public static string BimlDataType(DbType dataType, int length, int precision, int scale)
    {
        return BimlDataType(dataType.ToString(), length.ToString(), precision.ToString(), scale.ToString());
    }

    public static string BimlDataType(this AstFlatFileColumnNode column, DbType dataType, int length, int precision, int scale)
    {
        return BimlDataType(dataType.ToString(), length.ToString(), precision.ToString(), scale.ToString());
    }

    public static string BimlDataType(this AstFlatFileColumnNode column, string dataType, int length, int precision, int scale)
    {
        return BimlDataType(dataType.ToString(), length.ToString(), precision.ToString(), scale.ToString());
    }

    public static string GetTableColumn(this AstFlatFileColumnNode column, bool isNullable = true)
    {
        return "<Column Name=\"" + column.Name + "\" " + BimlDataType(column.DataType, column.Length, column.Precision, column.Scale) + " IsNullable=\"" + isNullable.ToString().ToLower() + "\" />";
    }

}