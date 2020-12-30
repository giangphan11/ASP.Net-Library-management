<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLDoiTuong.aspx.cs" Inherits="LibraryManagement.Admin.AQLDoiTuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/giangp.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    

    <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h3>
							Quản lý đối tượng
						</h3>
					</div>
					
					
					<asp:TextBox placeholder="Tìm kiếm theo tên" CssClass="search half" ID="txtTimKiem" runat="server" />
    <asp:Button ID="btnTimKiem" Text="Tìm kiếm" CssClass="button" runat="server" OnClick="btnTimKiem_Click" />
    <asp:GridView class="col-12 col-m-12 col-sm-12"  ID="gvDoiTuong" runat="server" AutoGenerateColumns="false"
        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
        <Columns>
            <asp:BoundField DataField="MaDT" HeaderText="Mã" />
            <asp:BoundField DataField="TenDT" HeaderText="Tên" />
            
            <asp:TemplateField HeaderText="Sửa đối tượng">
                <ItemTemplate>
                    <asp:Button ID="btnSua" CssClass="button b"
                        Text="Sửa" 
                        CommandName="suaDt" 
                        CommandArgument='<%#Bind("MaDT") %>' 
                        OnCommand="xuLySua"
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Xoá đối tượng">
                <ItemTemplate>
                    <asp:Button ID="btnXoa" CssClass="button r"
                        Text="Xoá" 
                        CommandName="xoaDt" 
                        CommandArgument='<%#Bind("MaDT") %>' 
                        OnClientClick="return confirm('are you sure about that??')" 
                        OnCommand="xuLyXoa"
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblThongBao" runat="server" />
    <br />
    <h3>Thêm đối tượng</h3>
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>Mã đối tượng: </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox CssClass="inp" ID="txtMaDT" runat="server" />
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>Tên đối tượng: </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtTenDT" CssClass="inp" runat="server" />
            </asp:TableCell></asp:TableRow>
        <asp:TableFooterRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="btnThem" Width="100%" Text="Thêm" runat="server" CssClass="button" OnClick="btnThem_Click" />
            </asp:TableCell>

        </asp:TableFooterRow>
    </asp:Table>
    
				</div>
			</div>
    

    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.doituong').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
