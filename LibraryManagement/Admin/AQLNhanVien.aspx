<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLNhanVien.aspx.cs" Inherits="LibraryManagement.Admin.AQLNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Quản lý nhân viên</h2>
    <p>&nbsp;</p>
    <asp:GridView ID="gvNhanVien_ad" AutoGenerateColumns="false" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
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
            <asp:BoundField HeaderText="Ảnh" DataField="Anh" />
            <asp:TemplateField HeaderText="Xoá nhân viên">
                <ItemTemplate>
                    <asp:Button ID="btnXoaNV" Text="Xoá" CommandName="xoanv" CommandArgument='<%#Bind("MaNV") %>'
                        runat="server" OnClientClick="return confirm('Xác nhận xoá')" OnCommand="xu_ly_XoaNV"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <p>&nbsp;</p>
    <h2>Thêm nhân viên</h2>
    
    <p>&nbsp;<asp:Table runat="server">
        <asp:TableRow>
            <asp:TableHeaderCell>Mã nhân viên:</asp:TableHeaderCell>
            <asp:TableCell><asp:TextBox ID="txtMaNV" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Tên nhân viên:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="txtTen" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Chức vụ:</asp:TableHeaderCell><asp:TableCell>
                <asp:DropDownList ID="dropDownListCV" runat="server"></asp:DropDownList></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Tên đăng nhập:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="txtUsername" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Mật khẩu:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="txtPass" runat="server" /></asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableHeaderCell>Ảnh:</asp:TableHeaderCell><asp:TableCell>
            <asp:FileUpload ID="fileUploadAnh" runat="server" /></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Button ID="btnThem" Text="Thêm" OnClick="xuLyThem" runat="server"/>
    <p>&nbsp;</p><asp:Label ID="lblThongBao" runat="server" />
</asp:Content>
