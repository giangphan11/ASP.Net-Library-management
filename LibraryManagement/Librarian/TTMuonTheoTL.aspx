<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/SiteLibra.Master" AutoEventWireup="true" CodeBehind="TTMuonTheoTL.aspx.cs" Inherits="LibraryManagement.Librarian.TTMuonTheoTL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung2" runat="server">


    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.muontheotheloai').toggleClass('active')
        })
    </script>
</asp:Content>
