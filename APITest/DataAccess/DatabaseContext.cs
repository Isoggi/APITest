using APITest.Models;
using APITest.ViewModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace APITest.DataAccess
{
    public class DatabaseContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        //public DbSet<SP_AverageScore> GetAverageScores { get; set; }


        public virtual ObjectResult<bool> GetUserLogin(UserLogin userLogin)
        {
            ObjectParameter _username = new ObjectParameter("Username", userLogin.Username);
            ObjectParameter _password = new ObjectParameter("Password", userLogin.Password);

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<bool>("usp_Login", _username, _password);
        }
        public virtual ObjectResult<bool> PostRegisterLogin(User user)
        {
            ObjectParameter _username = new ObjectParameter("Username", user.Username);
            ObjectParameter _password = new ObjectParameter("Password", user.Password);
            ObjectParameter _age = new ObjectParameter("Password", user.Age);

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<bool>("usp_RegisterLogin", _username, _password, _age);
        }
        
        public virtual ObjectResult<SP_AverageScore> GetAverageScore(string username, string password)
        {
            ObjectParameter _username = new ObjectParameter("Username", username);
            ObjectParameter _password = new ObjectParameter("Password", password);

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_AverageScore>("SP_AverageScore", _username, _password);
        }
        public virtual ObjectResult<SP_ModusScore> GetModusScore(string username, string password)
        {
            ObjectParameter _username = new ObjectParameter("Username", username);
            ObjectParameter _password = new ObjectParameter("Password", password);

            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_ModusScore>("SP_AverageScore", _username, _password);
        }
    }
}