<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLNhanVien.aspx.cs" Inherits="LibraryManagement.Admin.AQLNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
    
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">

    <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h3>
							Quản lý nhân viên
						</h3>
					</div>
					
					<asp:TextBox CssClass="search half" placeholder="Tìm kiếm theo tên" ID="txtTimKiem" runat="server" />
    <asp:Button CausesValidation="false" ID="btnTimKiem" CssClass="button" Text="Tìm kiếm" runat="server" OnClick="btnTimKiem_Click" />
					<asp:Label ID="lbTK" runat="server" />
                    <asp:GridView ID="gvNhanVien_ad" class="col-12 col-m-12 col-sm-12" AutoGenerateColumns="false" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
        <Columns>
            <asp:BoundField HeaderText="Mã" DataField="MaNV" />
            <asp:BoundField HeaderText="Tên" DataField="TenNV" />
            <asp:BoundField HeaderText="Mã chức vụ" DataField="MaCV" />
            <asp:BoundField HeaderText="Tên đăng nhập" DataField="Username" />
            <asp:BoundField HeaderText="Mật khẩu" DataField="PassWord" />
            <asp:ImageField ControlStyle-Width="100" ControlStyle-Height = "100" HeaderText="Ảnh" DataImageUrlField="Anh" />
            
            
            <asp:TemplateField HeaderText="Sửa nhân viên">
                <ItemTemplate>
                    <asp:Button CausesValidation="false" ID="btnSua" Text="Sửa" CssClass="button b" CommandName="suanv" CommandArgument='<%#Bind("MaNV") %>'
                        runat="server"  OnCommand="xu_ly_sua"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Xoá nhân viên">
                <ItemTemplate>
                    <asp:Button CausesValidation="false" ID="btnXoaNV" CssClass="button r" Text="Xoá" CommandName="xoanv" CommandArgument='<%#Bind("MaNV") %>'
                        runat="server" OnClientClick="return confirm('Xác nhận xoá')" OnCommand="xu_ly_XoaNV"/>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
    </asp:GridView>
    <h3>Thêm nhân viên</h3>

<asp:Table runat="server" class="col-10 col-m-10 col-sm-10">
        <asp:TableRow>
            <asp:TableHeaderCell>Mã nhân viên:</asp:TableHeaderCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMaNV" CssClass="inp" runat="server" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="rxtMa" runat="server" ControlToValidate="txtMaNV"
                        ErrorMessage="Mã không được để trống!" ForeColor="red"/>
            </asp:TableCell>

        </asp:TableRow>
    <asp:TableRow>
            <asp:TableHeaderCell>Tên nhân viên:</asp:TableHeaderCell>
        <asp:TableCell><asp:TextBox CssClass="inp" ID="txtTen" runat="server" />
        </asp:TableCell>
        <asp:TableCell>
            <asp:RequiredFieldValidator ID="rq2" runat="server" ControlToValidate="txtTen"
                        ErrorMessage="Tên không được để trống!" ForeColor="red"/>
        </asp:TableCell>
    </asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Chức vụ:</asp:TableHeaderCell><asp:TableCell>
                <asp:DropDownList ID="dropDownListCV" CssClass="drop" runat="server"></asp:DropDownList></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Tên đăng nhập:</asp:TableHeaderCell>
                    <asp:TableCell><asp:TextBox CssClass="inp" ID="txtUsername" runat="server" />

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rq3" runat="server" ControlToValidate="txtUsername"
                        ErrorMessage="Tên đăng nhập không được để trống!" ForeColor="red"/>
                    </asp:TableCell>
                                                                                                                                       </asp:TableRow>
    <asp:TableRow>
            <asp:TableHeaderCell>Mật khẩu:</asp:TableHeaderCell>
        <asp:TableCell><asp:TextBox ID="txtPass" CssClass="inp" runat="server" /></asp:TableCell>
        <asp:TableCell>
            <asp:RequiredFieldValidator ID="rq4" runat="server" ControlToValidate="txtPass"
                        ErrorMessage="Mật khẩu không được để trống!" ForeColor="red"/>
        </asp:TableCell>
    </asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Ảnh:</asp:TableHeaderCell>
                <asp:TableCell>
            <asp:FileUpload ID="fileUploadAnh" CssClass="inp" runat="server" />
                </asp:TableCell>
        </asp:TableRow>
    <asp:TableFooterRow>
        <asp:TableCell ColumnSpan="2">
            <asp:Button CausesValidation="true" Width="100%" ID="btnThem" CssClass="button" Text="Thêm" OnClick="xuLyThem" runat="server"/>
        </asp:TableCell>
    </asp:TableFooterRow>
    </asp:Table>
    
					
					
				</div>
			</div>
    <asp:Label ID="lblThongBao" runat="server" />

     <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.nhanvien').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
