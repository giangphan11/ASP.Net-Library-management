<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLChucVu.aspx.cs" Inherits="LibraryManagement.Admin.AQLChucVu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/nackbarCustom.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Quản lý chức vụ</h2>
    <p>&nbsp;</p>
    <asp:GridView ID="gvChucVu_ad" runat="server" AutoGenerateColumns="false" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
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
            <asp:BoundField HeaderText="Mã chức vụ" DataField="MaChucVu"/>
            <asp:BoundField HeaderText="Tên chức vụ" DataField="TenChucVu"/>
            <asp:TemplateField HeaderText="Xoá">
                <ItemTemplate>
                    <asp:Button ID="btnXoaChucVu" CommandName="xoaChucVu" Text="Xoá chức vụ"
                        CommandArgument='<%# Bind("MaChucVu") %>' runat="server"
                        OnCommand="quanLyXoa"
                        OnClientClick="return confirm('Xác nhận xoá ?')"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Sửa">
                <ItemTemplate>
                    <asp:Button ID="btnSuaChucVu" OnCommand="suaChucVu" CommandName="suaChucVu" Text="Sửa chức vụ"
                        CommandArgument='<%# Bind("MaChucVu") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <p>&nbsp;</p>
    <h2>Thêm chức vụ</h2>
    <table>
        <tr>
            <td>Mã chức vụ: </td>
            <td><asp:TextBox ID="txtMa" runat="server"/></td>
        </tr>
        <tr>
            <td>Tên chức vụ: </td>
            <td><asp:TextBox ID="txtTen" runat="server"/></td>
        </tr>
        
    </table>
    
    <asp:Button ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />

    <asp:Label ID="lblThongBao" runat="server" />

</asp:Content>
