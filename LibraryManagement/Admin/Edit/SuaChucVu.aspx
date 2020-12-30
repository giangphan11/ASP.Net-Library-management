<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaChucVu.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaChucVu" %>
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
							Sửa chức vụ
						</h3>
					</div>
					
					
					<table class="col-6 col-m-6 col-sm-6">
        <tr>
            <td>Mã chức vụ: </td>
            <td><asp:TextBox CssClass="inp" ID="txtMa" Enabled="false" runat="server"/></td>
        </tr>
        <tr>
            <td>Tên chức vụ: </td>
            <td><asp:TextBox CssClass="inp" ID="txtTen" runat="server"/></td>
        </tr>
        <tr>
            <td>
                 <asp:Button CssClass="button g" runat="server" Text="Quay lại" ID="btnHuy" OnClick="btnHuy_Click" />
            </td>
            <td>
                <asp:Button Width="100%" runat="server" CssClass="button" ID="btnSua" Text="Sửa" OnClick="btnSua_Click" />
            </td>
            
        </tr>
    </table>
    <asp:Label ID="lbThongBao" runat="server" />
    <br />
    	
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
    <br />
   <br />
   <br />
   <br />
   
    
</asp:Content>
