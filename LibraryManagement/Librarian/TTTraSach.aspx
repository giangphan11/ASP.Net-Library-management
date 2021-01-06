<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/SiteLibra.Master" AutoEventWireup="true" CodeBehind="TTTraSach.aspx.cs" Inherits="LibraryManagement.Librarian.TTTraSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <link href="/css/style_tra_sach1.css" type="text/css" rel="stylesheet" />
    <style>
        #container #fter h3{
            margin:auto 0;

        }
        .full {
    width: 60% !important;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung2" runat="server">

    <div id="container">
        <div id="idHead">
            <h3>Quản lý trả sách</h3>
        </div>
        <!--end head-->
        <div id="idBody">
            <div id="left">

                <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						
					</div>
					
					
					<asp:Label Text="Mã độc giả" runat="server" />
                <asp:TextBox CssClass="search full" ID="txtMaDG" runat="server" />
                <asp:Button CssClass="button" ID="btnTimKiem" Text="Tìm kiếm" runat="server" OnClick="btnTimKiem_Click" />
                <br />
                    <asp:Label ID="lbThongBao" runat="server" />
					
				</div>
			</div>

                
            </div>
            <!--end left-->

            <div id="right">

                <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h3>
							Thông tin chi tiết phiếu
						</h3>
					</div>
					
					
					<table>
                    <tr>
                        <td>Mã phiếu:</td>
                        <td>
                            <asp:Label ID="lbMaPhieu" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Mã độc giả:</td>
                        <td>
                            <asp:Label ID="lbMaDocGia" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Tên độc giả:</td>
                        <td>
                            <asp:Label ID="lbTenDocGia" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Ngày mượn:</td>
                        <td>
                            <asp:Label ID="lbNgayMuon" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Mã nhân viên:</td>
                        <td>
                            <asp:Label ID="lbMaNV" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Tên nhân viên:</td>
                        <td>
                            <asp:Label ID="lbTenNV" runat="server" /></td>
                    </tr>
                </table>
					
					
					
					
				</div>
			</div>

                
            </div>
            <!--end right-->
        </div>
        <!--end body-->
        <div id="tb1">

            <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h3>
							Thông tin các phiếu mượn
						</h3>
					</div>
            <asp:GridView AutoGenerateColumns="false" class="col-12 col-m-12 col-sm-12" ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                CellPadding="3">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#000066" HorizontalAlign="Left" BackColor="White" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                <Columns>
                    <asp:BoundField HeaderText="Mã phiếu mượn" DataField="a" />
                    <asp:BoundField HeaderText="Tên độc giả" DataField="b" />
                    <asp:BoundField HeaderText="Tên nhân viên" DataField="c" />
                    <asp:BoundField HeaderText="Ngày mượn" DataField="d" />
                </Columns>
            </asp:GridView>
					
					
					
					
				</div>
			</div>


        </div>
        <!--end tb1-->
        <div id="tb2">

            <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h3>
							Thông tin các tài liệu đang mượn
						</h3>
					</div>
					<asp:GridView class="col-12 col-m-12 col-sm-12"
                        AutoGenerateColumns="False" ID="GridView2" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView22_SelectedIndexChanged"
                BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
                CellPadding="3" CellSpacing="1" GridLines="None">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#C6C3C6" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
                        <Columns>
                            <asp:BoundField HeaderText="Mã tài liệu" DataField="a" />
                            <asp:BoundField HeaderText="Tên tài liệu" DataField="b" />
                            <asp:BoundField HeaderText="Số lượng" DataField="c" />
                            <asp:BoundField HeaderText="Ngày trả" DataField="d" />
                        </Columns>

            </asp:GridView>
					
					
				</div>
			</div>

            
        </div>
        <!--end tb2-->
        <div id="tra">
            
            <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						
					</div>
					
					<table>
                <tr>
                    <td>Mã phiếu:</td>
                    <td>
                        <asp:Label ID="txtMaPhieu" runat="server" /></td>
                </tr>
                <tr>
                    <td>Mã tài liệu:</td>
                    <td>
                        <asp:Label ID="txtMaSach" runat="server" /></td>
                </tr>
                <tr>
                    <td>Số lượng:</td>
                    <td>
                        <asp:Label ID="txtSoLuongTra" runat="server" /></td>
                </tr>
                <tr>
                    <td>Tên sách:</td>
                    <td>
                        <asp:Label ID="txtTenSach" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button Width="100%" CssClass="button" ID="btnTraSach" runat="server" Text="Trả sách" OnClick="btnTraSach_Click" />
                    </td>
                </tr>
            </table>
					
					
					
					
					
				</div>
			</div>
            
            
            
            

        </div>
        <div id="fter">
            <h3 style="text-align:center;">Nhóm 10 | Hệ thống quản lý thư viện - Đại học Công nghiệp Hà Nội</h3>
        </div>
    </div>

    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.trasach').toggleClass('active')
        })
    </script>
</asp:Content>
