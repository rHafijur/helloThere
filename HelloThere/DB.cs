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
        DataTable datatable;
        MySqlCommand command;
        public DB()
        {
            mysqlConnection = new MySqlConnection("server=localhost;port=3305;uid=root;pwd=mysqlroot;database=hellothere");
        }
        public DataTable GetTable(string query)
        {
            datatable = new DataTable();
            mysqlDataAdapter = new MySqlDataAdapter(query, mysqlConnection);
            mysqlDataAdapter.Fill(datatable);
            return datatable;
        }
        public DataTable AuthQuery(string email,string password)
        {
            Hash hash = new Hash();
            password = hash.ToMD5(password);
            datatable = new DataTable();
            mysqlDataAdapter = new MySqlDataAdapter("SELECT id, email from users where email='" + email + "' AND password='" + password + "'",mysqlConnection);
            mysqlDataAdapter.Fill(datatable);
            return datatable;
        }
        public DataTable Search(string name)
        {
            datatable = new DataTable();
            mysqlDataAdapter = new MySqlDataAdapter("SELECT * FROM users WHERE name LIKE'%"+name+"%' AND id!='"+Auth.id()+"'", mysqlConnection);
            mysqlDataAdapter.Fill(datatable);
            return datatable;
        }
        public int executequery(string query)
        {
            if (mysqlConnection.State == ConnectionState.Closed)
            {
                mysqlConnection.Open();
            }
            MySqlCommand cmd = new MySqlCommand(query, mysqlConnection);
            //cmd.ExecuteNonQuery();
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