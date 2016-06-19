using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;

namespace gmap
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!ClientScript.IsStartupScriptRegistered("window"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "window", "CreateMarker();", true);
            }

        }

        [WebMethod]
        public static MAPS[] BindMapMarker()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            List<MAPS> lstMarkers = new List<MAPS>();
            try
            {

                dt.Columns.Add("LocationName");
                dt.Columns.Add("Latitude");
                dt.Columns.Add("Longitude");

                dt.Rows.Add("LocationName 1", "23.722449", "90.401508");
                dt.Rows.Add("LocationName 2", "23.715667", "90.384295");
                dt.Rows.Add("LocationName 3", "23.723928", "90.405924");
                dt.Rows.Add("LocationName 4", "23.716426", "90.395794");
                dt.Rows.Add("LocationName 5", "23.721985", "90.399379");

                foreach (DataRow dtrow in dt.Rows)
                {
                    MAPS objMAPS = new MAPS();
                    objMAPS.LocationName = dtrow[0].ToString();
                    objMAPS.Latitude = dtrow[1].ToString();
                    objMAPS.Longitude = dtrow[2].ToString();
                    lstMarkers.Add(objMAPS);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }


            return lstMarkers.ToArray();
        }



        public class MAPS
        {
            public string LocationName;
            public string Latitude;
            public string Longitude;
        }

    }
}
