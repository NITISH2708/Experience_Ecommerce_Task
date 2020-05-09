using Experience_EcommLibrary;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Experience_Ecomm_API.Controllers
{
    public class ReimbursementController : ApiController
    {
        [HttpGet]
        public HttpResponseMessage GetReimbursement(int id)
        {
            using (ExperienceEcommerceDBEntities emp = new ExperienceEcommerceDBEntities())
            {
                var entity = emp.Reimbursement_Form.FirstOrDefault(e => e.Rem_ID == id);
                if (entity != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entity);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, id + "not found");
                }
            }
        }
        [HttpGet]
        [Route("api/Reimbursement/{fromdate}/{todate}")]
        public HttpResponseMessage GetReimbursement(DateTime fromdate,DateTime todate)
        {
            using (ExperienceEcommerceDBEntities emp = new ExperienceEcommerceDBEntities())
            {
       
                var entity = emp.Reimbursement_Form.FirstOrDefault(x => x.From_Date == fromdate && x.To_Date==todate);
                if (entity != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entity);
                }
                else
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound,"not found");
                }
            }
        }
        [HttpPost]
        public HttpResponseMessage Reimbursement(Reimbursement_Form reform)
        {
            try
            {
                using (ExperienceEcommerceDBEntities emp = new ExperienceEcommerceDBEntities())
                {
                    emp.Reimbursement_Form.Add(reform);
                    emp.SaveChanges();
                    var message = Request.CreateResponse(HttpStatusCode.Created, reform);
                    return message;
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }

        }
    }
}
