<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLTacGia.aspx.cs" Inherits="LibraryManagement.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Tác giả
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Quản lý tác giả</h2>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

    <h2>Thêm tác giả</h2>
    <table>
        <tr>
            <td><asp:Label runat="server" Text="Mã:" /></td>
            <td><asp:TextBox ID="txtMa" runat="server" /></td>
        </tr>
        <tr>
            <td><asp:Label runat="server" Text="Tên:" /></td>
            <td><asp:TextBox ID="txtTen" runat="server" /></td>
        </tr>
    </table>
    <asp:Button ID="btnQuaylai" Text="Quay lại" runat="server" Height="29px" OnClick="btnQuaylai_Click" />
    <asp:Button ID="btnThem" Text="Thêm" runat="server" OnClick="btnThem_Click" />
</asp:Content>
