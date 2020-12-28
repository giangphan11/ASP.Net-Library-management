<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLTaiLieu.aspx.cs" Inherits="LibraryManagement.Admin.AQLTaiLieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Quản lý Tài Liệu</h2>

    <asp:TextBox placeholder="Tìm kiếm theo tên" ID="txtTimKiem" runat="server" />
    <asp:Button ID="btnTimKiem" Text="Tìm kiếm" runat="server" OnClick="btnTimKiem_Click" />
    <p>&nbsp;</p>
    <asp:GridView ID="grTaiLieu" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
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
            <asp:BoundField HeaderText="Mã tài liệu" DataField="MaTLieu"/>
            <asp:BoundField HeaderText="Tên tài liệu" DataField="TenTLieu"/>
            <asp:BoundField HeaderText="Mã thể loại" DataField="MaTLoai"/>
            <asp:BoundField HeaderText="Số lượng" DataField="SLuong"/>
            <asp:BoundField HeaderText="Nhà xuất bản" DataField="NXB"/>
            <asp:BoundField HeaderText="Năm xuất bản" DataField="NamXB"/>
            <asp:ImageField ControlStyle-Width="100" ControlStyle-Height = "100" HeaderText="Ảnh" DataImageUrlField="Anh" />
            <asp:BoundField HeaderText="Tác giả" DataField="MaTG"/>
            
            <asp:TemplateField HeaderText="Xoá tài liệu">
                <ItemTemplate>
                    <asp:Button ID="btnXoaTaiLieu" CommandName="xoaTaiLieu" Text="Xoá"
                        CommandArgument='<%# Bind("MaTLieu") %>' runat="server"
                        OnCommand="quanLyXoa"
                        OnClientClick="return confirm('Xác nhận xoá ?')"/>
                </ItemTemplate>
            </asp:TemplateField>

            
            <asp:TemplateField HeaderText="Sửa tài liệu">
                <ItemTemplate>
                    <asp:Button ID="btnSuaTaiLieu" CommandName="suaTaiLieu" Text="Sửa"
                        CommandArgument='<%# Bind("MaTLieu") %>' runat="server"
                        OnCommand="quanLySua"
                        />
                </ItemTemplate>
            </asp:TemplateField>


        </Columns>
    </asp:GridView>
    <p>&nbsp;</p>
    <h2>Thêm tài liệu</h2>
    <table>
        <tr>
            <td>Mã tài liệu: </td>
            <td><asp:TextBox ID="txtMaTLieu" runat="server"/></td>
        </tr>
        <tr>
            <td>Tên tài liệu: </td>
            <td><asp:TextBox ID="txtTenTLieu" runat="server"/></td>
        </tr>
         <tr>
            <td>Mã thể loại: </td>
            <td><asp:DropDownList ID="dropTheLoai" runat="server" /></td>
        </tr> <tr>
            <td>Số lượng: </td>
            <td><asp:TextBox ID="txtSoLuong" TextMode="Number" runat="server"/></td>
        </tr> <tr>
            <td>Nhà xuất bản: </td>
            <td><asp:TextBox ID="txtNXB" runat="server"/></td>
        </tr> <tr>
            <td>Năm xuất bản: </td>
            <td><asp:TextBox ID="txtNamXB" TextMode="Number" runat="server"/></td>
        </tr> <tr>
            <td>Tác giả: </td>
            <td><asp:DropDownList ID="drTacGia" runat="server" /></td>
        </tr>
        <tr>
            <td>Ảnh:</td>
            <td><asp:FileUpload ID="fileAnh" runat="server" /></td>
        </tr>
        
    </table>
    <asp:Button ID="btnQuanLyTacGia" runat="server" Text="Quản lý tác giả" OnClick="btnQuanLyTacGia_Click" />
    <asp:Button ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />

    <asp:Label ID="messenger" runat="server" />


    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.tailieu').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
