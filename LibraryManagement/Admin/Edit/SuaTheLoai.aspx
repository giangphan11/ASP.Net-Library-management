<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaTheLoai.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaTheLoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">Sửa chức vụ
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="/css/giangp.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    
    <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h3>
							Sửa thể loại
						</h3>
					</div>
					
					<asp:Label ID="lb1" runat="server" />
    <table class="col-6 col-m-6 col-sm-6">
        <tr>
            <td>Mã thể loại: </td>
            <td><asp:TextBox CssClass="inp" Enabled="false" ID="txtMa" runat="server"/></td>
        </tr>
        <tr>
            <td>Tên thể loại: </td>
            <td><asp:TextBox ID="txtTen" CssClass="inp" runat="server"/></td>
        </tr>
         <tr>
            <td>Ghi chú: </td>
            <td><asp:TextBox ID="txtGhiChu" CssClass="inp" runat="server"/></td>
        </tr>
        <tr>
            <td>
                <asp:Button Text="Quay lại" CssClass="button g" runat="server" ID="btnHuy" OnClick="btnHuy_Click" />
            </td>
            <td>
                <asp:Button CssClass="button" Width="100%" Text="Sửa" runat="server" ID="btnSua" OnClick="btnSua_Click" />
            </td>
        </tr>
    </table>
    
				</div>
			</div>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>