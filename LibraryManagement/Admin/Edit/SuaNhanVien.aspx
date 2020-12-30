<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaNhanVien.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Sửa nhân viên
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="/css/giangp.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    
    <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h3>
							Sửa nhân viên
						</h3>
					</div>

					<asp:Image ID="imgHead" runat="server" Width="200px" Height="200px" />

    <asp:Table class="col-7 col-m-7 col-sm-7" runat="server">
        <asp:TableRow>
            <asp:TableHeaderCell>Mã nhân viên:</asp:TableHeaderCell>
            <asp:TableCell><asp:TextBox CssClass="inp" Enabled="false" ID="txtMaNV" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Tên nhân viên:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="txtTen" CssClass="inp" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Chức vụ:</asp:TableHeaderCell><asp:TableCell>
                <asp:DropDownList CssClass="inp" ID="dropDownListCV" runat="server"></asp:DropDownList></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Tên đăng nhập:</asp:TableHeaderCell><asp:TableCell><asp:TextBox CssClass="inp" ID="txtUsername" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Mật khẩu:</asp:TableHeaderCell><asp:TableCell><asp:TextBox CssClass="inp" ID="txtPass" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Ảnh:</asp:TableHeaderCell><asp:TableCell>
            <asp:FileUpload ID="fileUploadAnh" CssClass="inp" runat="server" /></asp:TableCell>
        </asp:TableRow>
        <asp:TableFooterRow>
            <asp:TableCell>
                <asp:Button CssClass="button g" ID="btnQuayLai" runat="server" Text="Quay lại" OnClick="btnQuayLai_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSua" CssClass="button" Width="100%" runat="server" Text="Sửa" OnClick="btnSua_Click" />
            </asp:TableCell>
        </asp:TableFooterRow>
    </asp:Table>
    <asp:Label ID="lblThongBao" runat="server" />
    <br />
    
					
				</div>
			</div>

    </asp:Content>
