using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ScriptManager sc = (ScriptManager)Master.FindControl("ScriptManager1");
                if (sc.IsInAsyncPostBack)
                {
                    Debug.WriteLine("非同期POSTBACK");
                }
                else
                {
                    Debug.WriteLine("同期POSTBACK");
                    Label2.Text = "同期POSTBACKでの更新";
                }
            }
            else
            {
                Debug.WriteLine("Init Page_Load()");
                Label2.Text = "ページロード初回";
                TextBox1.Text = "POSTBACKされても入力値は変わらない";
            }
            
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int time = int.Parse(Label1.Text) - 1;
            Debug.WriteLine(time);
            Label1.Text = time.ToString();
        }

        [WebMethod()]
        public static string GetData()
        {
            var date = DateTime.Now.ToShortDateString();
            return date;    
        }
    }
}