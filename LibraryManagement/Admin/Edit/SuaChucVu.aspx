<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaChucVu.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaChucVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">Sửa chức vụ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Sửa chức vụ</h2>

    <table>
        <tr>
            <td>Mã chức vụ: </td>
            <td><asp:TextBox ID="txtMa" Enabled="false" runat="server"/></td>
        </tr>
        <tr>
            <td>Tên chức vụ: </td>
            <td><asp:TextBox ID="txtTen" runat="server"/></td>
        </tr>
        
    </table>
    <asp:Label ID="lbThongBao" runat="server" />
    <br />
    <asp:Button runat="server" ID="btnSua" Text="Sửa" OnClick="btnSua_Click" />
    <asp:Button runat="server" Text="Quay lại" ID="btnHuy" OnClick="btnHuy_Click" />
</asp:Content>
