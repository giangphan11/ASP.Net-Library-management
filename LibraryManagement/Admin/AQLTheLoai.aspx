<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLTheLoai.aspx.cs" Inherits="LibraryManagement.Admin.AQLTheLoai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
   <h2>Quản lý thể loại</h2>
    <p>&nbsp;</p>
    <asp:GridView ID="grd" runat="server" AutoGenerateColumns="false" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="grd_SelectedIndexChanged">
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
            <asp:BoundField HeaderText="Mã thể loại" DataField="MaTLoai"/>
            <asp:BoundField HeaderText="Tên thể loại" DataField="TenTLoai"/>
            <asp:BoundField HeaderText="Ghi chú" DataField="GhiChu"/>

            <asp:TemplateField HeaderText="Xoá">
                <ItemTemplate>
                    <asp:Button ID="btnXoa" CommandName="delete" Text="Xoá"
                        CommandArgument='<%# Bind("MaTLoai") %>' runat="server"
                        OnCommand="delete"
                        OnClientClick="return confirm('Xác nhận xoá ?')"/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Sửa">
                <ItemTemplate>
                    <asp:Button ID="btnSua" OnCommand="update" CommandName="update" Text="Sửa"
                        CommandArgument='<%# Bind("MaTLoai") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <p>&nbsp;</p>
    <h2>Thêm thể loại</h2>
    <table>
        <tr>
            <td>Mã thể loại: </td>
            <td><asp:TextBox ID="txtMa" runat="server"/></td>
        </tr>
        <tr>
            <td>Tên thể loại: </td>
            <td><asp:TextBox ID="txtTen" runat="server"/></td>
        </tr>
         <tr>
            <td>Ghi chú: </td>
            <td><asp:TextBox ID="txtGhiChu" runat="server"/></td>
        </tr>
        
    </table>
    
    <asp:Button ID="btnThem" Width="100px" runat="server" Text="Thêm" OnClick="btnThem_Click" />

    <asp:Label ID="messenger" runat="server" />
</asp:Content>
