<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="DashBoadAdmin.aspx.cs" Inherits="LibraryManagement.Admin.DashBoadAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Quản trị viên
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
	<style>
	 .bg-danger {
    background:#ee5253!important ;
}
	</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Xin chào: <asp:Label ID="txtTen" runat="server" /></h2>



    <div class="row">
			<div class="col-3 col-m-6 col-sm-6">
				<div class="counter bg-primary">
					<p>
						<i class="fas fa-tasks"></i>
					</p>
					<h3>100+</h3>
					<p>To do</p>
				</div>
			</div>
			<div class="col-3 col-m-6 col-sm-6">
				<div class="counter bg-warning">
					<p>
						<i class="fas fa-spinner"></i>
					</p>
					<h3>100+</h3>
					<p>In progress</p>
				</div>
			</div>
			<div class="col-3 col-m-6 col-sm-6">
				<div class="counter bg-success">
					<p>
						<i class="fas fa-check-circle"></i>
					</p>
					<h3>100+</h3>
					<p>Completed</p>
				</div>
			</div>
			<div class="col-3 col-m-6 col-sm-6">
				<div class="counter bg-danger">
					<p>
						<i class="fas fa-bug"></i>
					</p>
					<h3>100+</h3>
					<p>Issues</p>
				</div>
			</div>
		</div>

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



	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
	<script src="/index.js"></script>
    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.dashboard').toggleClass('active')
        })
    </script>
</asp:Content>
