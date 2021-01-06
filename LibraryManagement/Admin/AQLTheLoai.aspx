<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLTheLoai.aspx.cs" Inherits="LibraryManagement.Admin.AQLTheLoai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/giangp.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">


    <div class="col-12 col-m-12 col-sm-12">
        <div class="card">
            <div class="card-header">
                <h3>Quản lý thể loại
                </h3>
            </div>

            <asp:TextBox CssClass="search half" placeholder="Tìm kiếm theo tên" ID="txtTimKiem" runat="server" />
            <asp:Button CausesValidation="false" ID="btnTimKiem" CssClass="button" Text="Tìm kiếm" runat="server" OnClick="btnTimKiem_Click" />
            <asp:Label ID="lblTK" runat="server" />
            <asp:GridView class="col-12 col-m-12 col-sm-12" ID="grd" runat="server" AutoGenerateColumns="false" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="grd_SelectedIndexChanged">
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
                    <asp:BoundField HeaderText="Mã thể loại" DataField="MaTLoai" />
                    <asp:BoundField HeaderText="Tên thể loại" DataField="TenTLoai" />
                    <asp:BoundField HeaderText="Ghi chú" DataField="GhiChu" />

                    <asp:TemplateField HeaderText="Sửa">
                        <ItemTemplate>
                            <asp:Button CausesValidation="false" CssClass="button b" ID="btnSua" OnCommand="update" CommandName="update" Text="Sửa"
                                CommandArgument='<%# Bind("MaTLoai") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Xoá">
                        <ItemTemplate>
                            <asp:Button CausesValidation="false" CssClass="button r" ID="btnXoa" CommandName="delete" Text="Xoá"
                                CommandArgument='<%# Bind("MaTLoai") %>' runat="server"
                                OnCommand="delete"
                                OnClientClick="return confirm('Xác nhận xoá ?')" />
                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>
            </asp:GridView>

            <h3>Thêm thể loại</h3>
            <table class="col-9 col-m-9 col-sm-9">
                <tr>
                    <td>Mã thể loại: </td>
                    <td>
                        <asp:TextBox CssClass="inp" ID="txtMa" runat="server" /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMa" Display="Dynamic"
                            ErrorMessage="Mã không được để trống!" ForeColor="red" />
                    </td>
                </tr>
                <tr>
                    <td>Tên thể loại: </td>
                    <td>
                        <asp:TextBox CssClass="inp" ID="txtTen" runat="server" /></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTen" Display="Dynamic"
                            ErrorMessage="Tên không được để trống!" ForeColor="red" />
                    </td>
                </tr>
                <tr>
                    <td>Ghi chú: </td>
                    <td>
                        <asp:TextBox CssClass="inp" ID="txtGhiChu" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button CausesValidation="true" Width="100%" ID="btnThem" CssClass="button" runat="server" Text="Thêm" OnClick="btnThem_Click" />
                    </td>
                </tr>
            </table>






        </div>
    </div>



    <asp:Label ID="messenger" runat="server" />

    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.theloai').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
