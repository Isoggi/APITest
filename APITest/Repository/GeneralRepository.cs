using APITest.Models;
using APITest.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace APITest.Repository
{
    public class GeneralRepository
    {
        public static string conn_string = System.Configuration.ConfigurationManager.AppSettings["DBConnection"];
        public static bool AddUser(User user)
        {
            bool status;
            string query = "";
            SqlConnection connection = new SqlConnection(conn_string);
            
            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                command.Dispose();
                connection.Close();
                status = true;
            }
            catch (Exception)
            {
                status = false;
            }
            return status;
        }

        public static bool GetUser(UserLogin login)
        {
            bool status;
            string query = "";
            SqlConnection connection = new SqlConnection(conn_string);

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                command.Dispose();
                connection.Close();
                status = true;
            }
            catch (Exception)
            {
                status = false;
            }
            return status;
        }
    }
}