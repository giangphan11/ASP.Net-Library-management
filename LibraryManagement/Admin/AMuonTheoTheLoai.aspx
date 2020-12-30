<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AMuonTheoTheLoai.aspx.cs" Inherits="LibraryManagement.Admin.AMuonTheoTheLoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Thống kê
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href ="/css/giangp.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">

    <h3>Thư viện trường Đại học Công nghiệp Hà Nội</h3>
    <p>Ngày lập: <asp:Label ID="txtNgayLap" runat="server" /></p>

    <p>Nguời lập: <asp:Label ID="txtNguoiLap" runat="server" /></p>
    

    <div style="margin:0 auto;" class="col-9 col-m-9 col-sm-9">
				<div class="card">
					<div class="card-header">
						<h3>Thống kê số lần mượn theo thể loại</h3>
					</div>
					
    <%--<p>&nbsp;</p>--%>
    <asp:GridView class="col-12 col-m-12 col-sm-12" ID="GridView1" AutoGenerateColumns="false" 
        runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
        <Columns>
            <asp:BoundField DataField ="MaTL" HeaderText="Mã thể loại" />
            <asp:BoundField DataField ="TenTL" HeaderText="Tên thể loại" />
            <asp:BoundField DataField ="SoLanMuon" HeaderText="Số lần mượn" />
            <asp:BoundField DataField ="GhiChu" HeaderText="Ghi chú" />
        </Columns>
    </asp:GridView>
    <h3>Chọn thời gian:</h3>
    Bắt đầu: <asp:TextBox CssClass="inp" Width="30%" ID="txtDate1" TextMode="Date" runat="server" OnTextChanged="txtDate1_TextChanged" />
    Kết thúc:<asp:TextBox CssClass="inp" Width="30%" ID="txtDate2" TextMode="Date" runat="server" OnTextChanged="txtDate2_TextChanged" />
    <asp:Button ID="btnXem" CssClass="button" runat="server" Text ="Xem" OnClick="btnXem_Click" />
    <br />

				</div>
			</div>

    <asp:Button style="margin-right:10px;" ID="btnInPdf" CssClass="button g" runat="server" Text ="Xuất file pdf" />
    <asp:Button ID="btnInWord" CssClass="button g" runat="server" Text ="Xuất file Word" />

<script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.muonTheoTL').toggleClass('active')
        })
    </script>   
</asp:Content>
