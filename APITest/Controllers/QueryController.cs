using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace APITest.Controllers
{
    public class QueryController : ApiController
    {
        [Route("api/Data")]
        public HttpResponseMessage GetAverageScore()
        {
            string data = "";

            return Request.CreateResponse(HttpStatusCode.OK, data, Configuration.Formatters.JsonFormatter);
        }
    }
}

