<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaTaiLieu.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaTaiLieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Sửa tài liệu
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="/css/giangp.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">

    <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h3>
							Sửa tài liệu
						</h3>
					</div>

					<asp:Image ID="imgAnhTL" runat="server" Height="150px" Width="150px" />
    <asp:Label ID="lbl1" runat="server" />

    <table class="col-6 col-m-6 col-sm-6">
        <tr>
            <td>Mã tài liệu: </td>
            <td><asp:TextBox CssClass="inp" ID="txtMaTLieu" Enabled="false" runat="server"/></td>
        </tr>
        <tr>
            <td>Tên tài liệu: </td>
            <td><asp:TextBox CssClass="inp" ID="txtTenTLieu" runat="server"/></td>
        </tr>
         <tr>
            <td>Mã thể loại: </td>
            <td><asp:DropDownList CssClass="inp" ID="dropTheLoai" runat="server" /></td>
        </tr> <tr>
            <td>Số lượng: </td>
            <td><asp:TextBox CssClass="inp" ID="txtSoLuong" TextMode="Number" runat="server"/></td>
        </tr> <tr>
            <td>Nhà xuất bản: </td>
            <td><asp:TextBox CssClass="inp" ID="txtNXB" runat="server"/></td>
        </tr> <tr>
            <td>Năm xuất bản: </td>
            <td><asp:TextBox CssClass="inp" ID="txtNamXB" TextMode="Number" runat="server"/></td>
        </tr> <tr>
            <td>Tác giả: </td>
            <td><asp:DropDownList CssClass="inp" ID="drTacGia" runat="server" /></td>
        </tr>
        <tr>
            <td>Ảnh:</td>
            <td><asp:FileUpload CssClass="inp" ID="fileAnh" runat="server" /></td>
        </tr>
        <tr>
            <td>
                <asp:Button CssClass="button g" ID="btnHuyBo" Text="Quay lại"  runat="server" OnClick="btnHuyBo_Click"/>
            </td>
            <td>
                <asp:Button Width="100%" CssClass=" button" ID="btnSua" Text ="Sửa" runat="server" OnClick="btnSua_Click" />
            </td>
        </tr>
    </table>
    
					
				</div>
			</div>

    


</asp:Content>
