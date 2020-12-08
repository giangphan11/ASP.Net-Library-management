<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AMuonTheoTheLoai.aspx.cs" Inherits="LibraryManagement.Admin.AMuonTheoTheLoai" %>
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


<script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.muonTheoTL').toggleClass('active')
        })
    </script>   
</asp:Content>
