<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaTheLoai.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaTheLoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">Sửa chức vụ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Sửa thể loại</h2>
    <asp:Label ID="lb1" runat="server" />
    <table>
        <tr>
            <td>Mã thể loại: </td>
            <td><asp:TextBox Enabled="false" ID="txtMa" runat="server"/></td>
        </tr>
        <tr>
            <td>Tên thể loại: </td>
            <td><asp:TextBox ID="txtTen" runat="server"/></td>
        </tr>
         <tr>
            <td>Ghi chú: </td>
            <td><asp:TextBox ID="txtGhiChu" runat="server"/></td>
        </tr>
        
    </table>
    <asp:Button Text="Sửa" runat="server" ID="btnSua" OnClick="btnSua_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button Text="Huỷ" runat="server" ID="btnHuy" OnClick="btnHuy_Click" />

</asp:Content>