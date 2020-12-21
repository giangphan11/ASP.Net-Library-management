using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTO;
using BLL;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
namespace LibraryManagement.Admin
{
    public partial class AMuonQuaHan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                loadData();
            if (Application["nhanvien"] == null)
            {
                Server.Transfer("/Login/LoginForm.aspx");
            }
            else
            {
                DateTime dt = DateTime.Now;
                txtNgayLap.Text = dt.ToString("dd/MM/yyyy");
                NhanVien nv = (NhanVien)Application["nhanvien"];
                txtNguoiLap.Text = nv.TenNV;
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }
        private void loadData()
        {
            gridView1.DataSource = new MuonQuaHanBLL().muonQuaHans();
            DataBind();
        }
        protected void btnExportPDF_Click(object sender, EventArgs e)

        {
            ExportGridToPDF();
        }


        private void ExportGridToPDF()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Vithal_Wadje.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            gridView1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            gridView1.AllowPaging = true;
            gridView1.DataBind();
        }



        protected void btnExportWord_Click(object sender, EventArgs e)

        {

            
                Response.Clear();

                Response.Buffer = true;

                Response.AddHeader("content-disposition",

                "attachment;filename=GridViewExport.doc");

                Response.Charset = "utf-8";
                
                Response.ContentType = "application/vnd.ms-word ";

                StringWriter sw = new StringWriter();

                HtmlTextWriter hw = new HtmlTextWriter(sw);

                gridView1.AllowPaging = false;

                gridView1.DataBind();

                gridView1.RenderControl(hw);

                Response.Output.Write(sw.ToString());

                Response.Flush();

                Response.End();
                lblThongBao.Text = "Xuất sang file Word thành công !";
            
        }

    }
}