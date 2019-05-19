using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

namespace HelloThere
{
    public class DB
    {
        MySqlConnection mysqlConnection;
        MySqlDataAdapter mysqlDataAdapter;
        DataSet dataset;
        public DB()
        {
            mysqlConnection = new MySqlConnection("server=localhost;port=3305;uid=root;pwd=mysqlroot;database=hellothere");
        }
        public int executequery(string query)
        {
            if (mysqlConnection.State == ConnectionState.Closed)
            {
                mysqlConnection.Open();
            }
            MySqlCommand cmd = new MySqlCommand(query, mysqlConnection);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (MySqlException e)
            {
                return 0;
            }
            return 1;

        }

    }
}