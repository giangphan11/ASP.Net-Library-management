<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaDoiTuong.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaDoiTuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Sửa đối tượng
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h3>Sửa đối tượng</h3>
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>Mã đối tượng: </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox Enabled="false" ID="txtMaDT" runat="server" />
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>Tên đối tượng: </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtTenDT" runat="server" />
            </asp:TableCell></asp:TableRow></asp:Table><asp:Label ID="lbThongBao" runat="server" />
    <br />
    <asp:Button ID="btnSua" Text="Sửa" runat="server" OnClick="btnSua_Click" /><asp:Button ID="btnQuayLai" Text="Quay lại" runat="server" OnClick="btnQuayLai_Click" /></asp:Content>
