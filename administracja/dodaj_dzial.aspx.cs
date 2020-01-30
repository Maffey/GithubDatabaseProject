using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class administracja_dodaj_dzial : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        Response.Redirect("~/administracja/dodaj_dzial.aspx");
    }
}