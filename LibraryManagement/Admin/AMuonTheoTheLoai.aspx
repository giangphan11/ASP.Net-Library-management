<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AMuonTheoTheLoai.aspx.cs" Inherits="LibraryManagement.Admin.AMuonTheoTheLoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Thống kê
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h1>Thống kê số lần mượn theo thể loại</h1>
    <p>&nbsp;</p>
    <h3>Thư viện trường Đại học Công nghiệp Hà Nội</h3>
    
    <p>Ngày lập: <asp:Label ID="txtNgayLap" runat="server" /></p>

    <p>Nguời lập: <asp:Label ID="txtNguoiLap" runat="server" /></p>
    <p>&nbsp;</p>

    <asp:GridView ID="GridView1" AutoGenerateColumns="false" 
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
    Bắt đầu: <asp:TextBox ID="txtDate1" TextMode="Date" runat="server" />
    Kết thúc:<asp:TextBox ID="txtDate2" TextMode="Date" runat="server" />
    <p>&nbsp;</p>
    <asp:Button ID="btnXem" runat="server" Text ="Xem" OnClick="btnXem_Click" />
    <asp:Button ID="btnInPdf" runat="server" Text ="Xuất file pdf" />
    <asp:Button ID="btnInWord" runat="server" Text ="Xuất file Word" />

<script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.muonTheoTL').toggleClass('active')
        })
    </script>   
</asp:Content>
