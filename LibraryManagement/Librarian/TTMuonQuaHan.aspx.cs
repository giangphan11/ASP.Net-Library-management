﻿using System;
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
using System.Data;

namespace LibraryManagement.Librarian
{
    public partial class TTMuonQuaHan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
            string filename = String.Format("Results_{0}_{1}.xls", DateTime.Today.Month.ToString(), DateTime.Today.Year.ToString());
            if (!string.IsNullOrEmpty(gridView1.Page.Title))
                filename = gridView1.Page.Title + ".xls";

            HttpContext.Current.Response.Clear();

            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + filename);


            HttpContext.Current.Response.ContentType = "application/vnd.ms-excel";
            HttpContext.Current.Response.Charset = "";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWriter = new HtmlTextWriter(stringWriter);



            System.Web.UI.HtmlControls.HtmlForm form = new System.Web.UI.HtmlControls.HtmlForm();
            gridView1.Parent.Controls.Add(form);
            form.Controls.Add(gridView1);
            form.RenderControl(htmlWriter);

            HttpContext.Current.Response.Write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
            HttpContext.Current.Response.Write(stringWriter.ToString());
            HttpContext.Current.Response.End();
        }


        protected void btnExportWord_Click(object sender, EventArgs e)
        {
            ExportToPDF(gridView1, "Tài liệu mượn quá hạn", false);
        }



        private void ExportToPDF(GridView gvReport, string tenBang, bool LandScape)
        {
            int noOfColumns = 0, noOfRows = 0;
            DataTable tbl = null;

            if (gvReport.AutoGenerateColumns)
            {
                tbl = gvReport.DataSource as DataTable; // Gets the DataSource of the GridView Control.
                noOfColumns = tbl.Columns.Count;
                noOfRows = tbl.Rows.Count;
            }
            else
            {
                noOfColumns = gvReport.Columns.Count;
                noOfRows = gvReport.Rows.Count;
            }

            float ApplicationNameSize = 7;

            // Creates a PDF document

            Document document = null;
            if (LandScape == true)
            {
                // Sets the document to A4 size and rotates it so that the     orientation of the page is Landscape.
                document = new Document(PageSize.A4.Rotate(), 0, 0, 15, 5);
            }
            else
            {
                document = new Document(PageSize.A4, 0, 0, 15, 5);
            }

            // Creates a PdfPTable with column count of the table equal to no of columns of the gridview or gridview datasource.
            iTextSharp.text.pdf.PdfPTable mainTable = new iTextSharp.text.pdf.PdfPTable(noOfColumns);

            // Sets the first 4 rows of the table as the header rows which will be repeated in all the pages.
            mainTable.HeaderRows = 4;
            string ARIALUNI_TFF = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Fonts), "times.TTF");
            BaseFont bf = BaseFont.CreateFont(ARIALUNI_TFF, BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
            iTextSharp.text.Font text = new iTextSharp.text.Font(bf, 14, iTextSharp.text.Font.NORMAL);

            // Creates a PdfPTable with 2 columns to hold the header in the exported PDF.
            iTextSharp.text.pdf.PdfPTable headerTable = new iTextSharp.text.pdf.PdfPTable(2);

            // Creates a phrase to hold the application name at the left hand side of the header.
            Phrase phApplicationName = new Phrase("Nhom 5 - Library management", text);

            // Creates a PdfPCell which accepts a phrase as a parameter.
            PdfPCell clApplicationName = new PdfPCell(phApplicationName);
            // Sets the border of the cell to zero.
            clApplicationName.Border = PdfPCell.NO_BORDER;
            // Sets the Horizontal Alignment of the PdfPCell to left.
            clApplicationName.HorizontalAlignment = Element.ALIGN_LEFT;

            // Creates a phrase to show the current date at the right hand side of the header.
            Phrase phDate = new Phrase(DateTime.Now.Date.ToString("dd/MM/yyyy"), FontFactory.GetFont("Arial", ApplicationNameSize, iTextSharp.text.Font.NORMAL));

            // Creates a PdfPCell which accepts the date phrase as a parameter.
            PdfPCell clDate = new PdfPCell(phDate);
            // Sets the Horizontal Alignment of the PdfPCell to right.
            clDate.HorizontalAlignment = Element.ALIGN_RIGHT;
            // Sets the border of the cell to zero.
            clDate.Border = PdfPCell.NO_BORDER;

            // Adds the cell which holds the application name to the headerTable.
            headerTable.AddCell(clApplicationName);
            // Adds the cell which holds the date to the headerTable.
            headerTable.AddCell(clDate);
            // Sets the border of the headerTable to zero.
            headerTable.DefaultCell.Border = PdfPCell.NO_BORDER;

            // Creates a PdfPCell that accepts the headerTable as a parameter and then adds that cell to the main PdfPTable.
            PdfPCell cellHeader = new PdfPCell(headerTable);
            cellHeader.Border = PdfPCell.NO_BORDER;
            // Sets the column span of the header cell to noOfColumns.
            cellHeader.Colspan = noOfColumns;
            // Adds the above header cell to the table.
            mainTable.AddCell(cellHeader);

            // Creates a phrase which holds the file name.
            Phrase phHeader = new Phrase(tenBang, text);
            PdfPCell clHeader = new PdfPCell(phHeader);
            clHeader.Colspan = noOfColumns;
            clHeader.Border = PdfPCell.NO_BORDER;
            clHeader.HorizontalAlignment = Element.ALIGN_CENTER;
            mainTable.AddCell(clHeader);

            // Creates a phrase for a new line.
            Phrase phSpace = new Phrase("\n");
            PdfPCell clSpace = new PdfPCell(phSpace);
            clSpace.Border = PdfPCell.NO_BORDER;
            clSpace.Colspan = noOfColumns;
            mainTable.AddCell(clSpace);

            // Sets the gridview column names as table headers.
            for (int i = 0; i < noOfColumns; i++)
            {
                Phrase ph = null;

                if (gvReport.AutoGenerateColumns)
                {
                    ph = new Phrase(tbl.Columns[i].ColumnName, text);
                }
                else
                {
                    ph = new Phrase(gvReport.Columns[i].HeaderText, text);
                }

                mainTable.AddCell(ph);
            }

            // Reads the gridview rows and adds them to the mainTable
            for (int rowNo = 0; rowNo < noOfRows; rowNo++)
            {
                for (int columnNo = 0; columnNo < noOfColumns; columnNo++)
                {
                    if (gvReport.AutoGenerateColumns)
                    {
                        string s = gvReport.Rows[rowNo].Cells[columnNo].Text.Trim();
                        Phrase ph = new Phrase(s, text);
                        mainTable.AddCell(ph);
                    }
                    else
                    {
                        if (gvReport.Columns[columnNo] is TemplateField)
                        {
                            DataBoundLiteralControl lc = gvReport.Rows[rowNo].Cells[columnNo].Controls[0] as DataBoundLiteralControl;
                            string s = lc.Text.Trim();
                            Phrase ph = new Phrase(s, text);
                            mainTable.AddCell(ph);
                        }
                        else
                        {
                            string s = gvReport.Rows[rowNo].Cells[columnNo].Text.Trim();
                            Phrase ph = new Phrase(s, text);
                            mainTable.AddCell(ph);
                        }
                    }
                }

                // Tells the mainTable to complete the row even if any cell is left incomplete.
                mainTable.CompleteRow();
            }

            // Gets the instance of the document created and writes it to the output stream of the Response object.
            PdfWriter.GetInstance(document, Response.OutputStream);

            // Creates a footer for the PDF document.

            //HeaderFooter pdfFooter = new HeaderFooter(new Phrase(), true);
            //pdfFooter.Alignment = Element.ALIGN_CENTER;
            //pdfFooter.Border = Rectangle.NO_BORDER;

            //// Sets the document footer to pdfFooter.
            //document.Footer = pdfFooter;
            // Opens the document.
            document.Open();
            // Adds the mainTable to the document.
            document.Add(mainTable);
            // Closes the document.
            document.Close();

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment; filename= SampleExport.pdf");
            Response.End();
        }
    }
}