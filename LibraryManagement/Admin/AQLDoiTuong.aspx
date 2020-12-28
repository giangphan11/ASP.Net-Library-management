<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLDoiTuong.aspx.cs" Inherits="LibraryManagement.Admin.AQLDoiTuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Quản lý đối tượng</h2>
    <asp:GridView ID="gvDoiTuong" runat="server" AutoGenerateColumns="false"
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
            <asp:TemplateField HeaderText="Xoá đối tượng">
                <ItemTemplate>
                    <asp:Button ID="btnXoa" 
                        Text="Xoá" 
                        CommandName="xoaDt" 
                        CommandArgument='<%#Bind("MaDT") %>' 
                        OnClientClick="return confirm('are you sure about that??')" 
                        OnCommand="xuLyXoa"
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Sửa đối tượng">
                <ItemTemplate>
                    <asp:Button ID="btnSua" 
                        Text="Sửa" 
                        CommandName="suaDt" 
                        CommandArgument='<%#Bind("MaDT") %>' 
                        OnCommand="xuLySua"
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="lblThongBao" runat="server" />
    <br />
    <h2>Thêm đối tượng</h2>
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>Mã đối tượng: </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMaDT" runat="server" />
            </asp:TableCell></asp:TableRow><asp:TableRow>
            <asp:TableCell>Tên đối tượng: </asp:TableCell><asp:TableCell>
                <asp:TextBox ID="txtTenDT" runat="server" />
            </asp:TableCell></asp:TableRow>

    </asp:Table>
    <asp:Button ID="btnThem" Text="Thêm" runat="server" OnClick="btnThem_Click" /><script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.doituong').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
