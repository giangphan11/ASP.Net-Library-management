<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="DashBoadAdmin.aspx.cs" Inherits="LibraryManagement.Admin.DashBoadAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Quản trị viên
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Xin chào: <asp:Label ID="txtTen" runat="server" /></h2>



    <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h3>
							Chartjs
						</h3>
					</div>
					<div class="card-content">
						<canvas id="myChart"></canvas>
					</div>
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
    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.dashboard').toggleClass('active')
        })
    </script>
</asp:Content>
