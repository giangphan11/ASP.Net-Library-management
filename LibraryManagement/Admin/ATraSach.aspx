<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ATraSach.aspx.cs" Inherits="LibraryManagement.ATraSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Quản lý trả sách
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">

    <h2>Quản lý trả sách</h2>




    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.trasach').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
