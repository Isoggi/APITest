using APITest.Models;
using APITest.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace APITest.Repository
{
    public class GeneralRepository
    {
        public static string conn_string = System.Configuration.ConfigurationManager.AppSettings["DBConnection"];

        public bool AddUser(User user)
        {
            bool status;
            string query = @"EXEC usp_RegisterProcess '@1', '@2', @3;";
            SqlConnection connection = new SqlConnection(conn_string);
            user.Password = CryptoRepository.Encrypt(user.Password);
            query = query.Replace("@1", user.Username)
                .Replace("@2",user.Password)
                .Replace("@3", (user.Age).ToString());

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
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

        public bool LoginUser(UserLogin login)
        {
            bool status;
            string query = @"EXEC usp_LoginProcess '@1', '@2'"; ;
            SqlConnection connection = new SqlConnection(conn_string);
            login.Password = CryptoRepository.Encrypt(login.Password);
            query = query.Replace("@1", login.Username)
                .Replace("@2", login.Password);

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
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