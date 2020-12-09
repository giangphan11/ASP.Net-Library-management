<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AMuonSach.aspx.cs" Inherits="LibraryManagement.AMuonSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Quản lý mượn sách
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Quản lý mượn sách</h2>
    <p>&nbsp;</p>
    <h3>Thông tin phiếu mượn</h3>
    <br />

    <p>&nbsp;</p>
    <h3>Chi tiết sách mượn</h3>
    <br />
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>


    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.muonsach').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
