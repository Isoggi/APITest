using APITest.DataAccess;
using APITest.Models;
using APITest.ViewModel;
using log4net;
using Microsoft.Ajax.Utilities;
using System;
using System.Data.SqlClient;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace APITest.Controllers
{
    public class LoginController : ApiController
    {
        //private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);


        [HttpPost]
        [Route("api/Login")]
        public HttpResponseMessage PostLogin(UserLogin user)
        {
            bool login_status = false;
            try
            {
                //log
                if (user != new UserLogin())
                {
                    
                }
            }
            catch (Exception)
            {
                //_logger.LogWarning(exception, "An exception occured");
                throw;
            }
            
            return Request.CreateResponse(HttpStatusCode.OK, login_status, Configuration.Formatters.JsonFormatter);

        }

        [HttpPost]
        [Route("api/Login/Register")]
        public HttpResponseMessage PostRegister(User user)
        {
            bool registration_status = false;
            if (user != new User())
            {
                registration_status = true;
            }
            return Request.CreateResponse(HttpStatusCode.OK, registration_status, Configuration.Formatters.JsonFormatter);
        }

        //// GET: api/Login
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        //// GET: api/Login/5
        //public string Get(int id)
        //{
        //    return "value:" + id;
        //}

        //// POST: api/Login
        //public void Post([FromBody]string value)
        //{
        //}

        //// PUT: api/Login/5
        //public void Put(int id, [FromBody]string value)
        //{
        //}

        //// DELETE: api/Login/5
        //public void Delete(int id)
        //{
        //}
    }
}
