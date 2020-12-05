<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLTaiLieu.aspx.cs" Inherits="LibraryManagement.Admin.AQLTaiLieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Trang</h2>


     <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.tailieu').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
