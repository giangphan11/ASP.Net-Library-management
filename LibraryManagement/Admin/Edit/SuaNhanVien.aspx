<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaNhanVien.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Sửa nhân viên
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h3>Sửa nhân viên</h3>

    <asp:Image ID="imgHead" runat="server" Width="200px" Height="200px" />

    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableHeaderCell>Mã nhân viên:</asp:TableHeaderCell>
            <asp:TableCell><asp:TextBox Enabled="false" ID="txtMaNV" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Tên nhân viên:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="txtTen" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Chức vụ:</asp:TableHeaderCell><asp:TableCell>
                <asp:DropDownList ID="dropDownListCV" runat="server"></asp:DropDownList></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Tên đăng nhập:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="txtUsername" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Mật khẩu:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="txtPass" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Ảnh:</asp:TableHeaderCell><asp:TableCell>
            <asp:FileUpload ID="fileUploadAnh" runat="server" /></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Label ID="lblThongBao" runat="server" />
    <br />
    <asp:Button ID="btnSua" runat="server" Text="Sửa" OnClick="btnSua_Click" /><asp:Button ID="btnQuayLai" runat="server" Text="Quay lại" OnClick="btnQuayLai_Click" /></asp:Content>
