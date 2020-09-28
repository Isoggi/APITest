using APITest.DataAccess;
using APITest.Models;
using APITest.Repository;
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
        private static readonly ILog log = LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        private readonly GeneralRepository _general;

        public LoginController(GeneralRepository general)
        {
            _general = general;
        }


        [HttpPost]
        [Route("api/Login")]
        public HttpResponseMessage PostLogin(UserLogin user)
        {
            //log.
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
                try
                {
                    registration_status = _general.AddUser(user);
                }
                catch (Exception)
                {

                    //throw;
                }
                registration_status = true;
            }
            return Request.CreateResponse(HttpStatusCode.OK, registration_status, Configuration.Formatters.JsonFormatter);
        }

    }
}
