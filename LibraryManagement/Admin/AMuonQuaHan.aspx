﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AMuonQuaHan.aspx.cs" Inherits="LibraryManagement.Admin.AMuonQuaHan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Thống kê
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h1>Thống kê tài liệu mượn quá hạn</h1>
    <p>&nbsp;</p>
    <h3>Thư viện trường Đại học Công nghiệp Hà Nội</h3>
    
    <p>Ngày lập: <asp:Label ID="txtNgayLap" runat="server" /></p>

    <p>Nguời lập: <asp:Label ID="txtNguoiLap" runat="server" /></p>
    <p>&nbsp;</p>
    <asp:GridView ID="gridView1" runat="server" AutoGenerateColumns="false"
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
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
            <asp:BoundField DataField="MaDocGia" HeaderText="Mã độc giả" />
            <asp:BoundField DataField="TenDocGia" HeaderText="Tên độc giả" />
            <asp:BoundField DataField="MaTL" HeaderText="Mã tài liệu" />
            <asp:BoundField DataField="TenTL" HeaderText="Tên tài liệu" />
            <asp:BoundField DataField="NgayMuon" HeaderText="Ngày mượn" />
            <asp:BoundField DataField="SoNgayMuonQH" HeaderText="Số ngày quá hạn" />
        </Columns>
    </asp:GridView>
    
    <asp:Button ID="btnXuatFile" Text="Xuất file Word" runat="server" OnClick="btnExportWord_Click" />
    <asp:Button ID="btnXuatPdf" Text="Xuất file Pdf" runat="server" OnClick="btnExportPDF_Click" />

    <asp:Label ID="lblThongBao" runat="server" />


<script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.muonQuaHan').toggleClass('active')
        })
    </script>    
</asp:Content>
