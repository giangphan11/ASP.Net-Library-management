<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/SiteLibra.Master" AutoEventWireup="true" CodeBehind="DashBoadLib.aspx.cs" Inherits="LibraryManagement.Librarian.DashBoadLib" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung2" runat="server">
    <h2>Hello: <asp:Label ID="txtTenThuThu" runat="server" /></h2>

    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.dashboard').toggleClass('active')
        })
    </script>
</asp:Content>
