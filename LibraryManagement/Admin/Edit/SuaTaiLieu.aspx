<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaTaiLieu.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaTaiLieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Sửa tài liệu
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h3>Sửa tài liệu</h3>

    <asp:Image ID="imgAnhTL" runat="server" Height="150px" Width="150px" />
    <asp:Label ID="lbl1" runat="server" />

    <table>
        <tr>
            <td>Mã tài liệu: </td>
            <td><asp:TextBox ID="txtMaTLieu" Enabled="false" runat="server"/></td>
        </tr>
        <tr>
            <td>Tên tài liệu: </td>
            <td><asp:TextBox ID="txtTenTLieu" runat="server"/></td>
        </tr>
         <tr>
            <td>Mã thể loại: </td>
            <td><asp:DropDownList ID="dropTheLoai" runat="server" /></td>
        </tr> <tr>
            <td>Số lượng: </td>
            <td><asp:TextBox ID="txtSoLuong" TextMode="Number" runat="server"/></td>
        </tr> <tr>
            <td>Nhà xuất bản: </td>
            <td><asp:TextBox ID="txtNXB" runat="server"/></td>
        </tr> <tr>
            <td>Năm xuất bản: </td>
            <td><asp:TextBox ID="txtNamXB" TextMode="Number" runat="server"/></td>
        </tr> <tr>
            <td>Tác giả: </td>
            <td><asp:DropDownList ID="drTacGia" runat="server" /></td>
        </tr>
        <tr>
            <td>Ảnh:</td>
            <td><asp:FileUpload ID="fileAnh" runat="server" /></td>
        </tr>
    </table>
    <asp:Button ID="btnSua" Text ="Sửa" runat="server" OnClick="btnSua_Click" />
    <asp:Button ID="btnHuyBo" Text="Quay lại"  runat="server" OnClick="btnHuyBo_Click"/>


</asp:Content>
