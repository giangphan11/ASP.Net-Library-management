<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLChucVu.aspx.cs" Inherits="LibraryManagement.Admin.AQLChucVu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">

    <div class="col-12 col-m-12 col-sm-12">
        <div class="card">
            <div class="card-header">
                <h3>Quản lý chức vụ
                </h3>
            </div>


            <asp:TextBox CssClass="search half" placeholder="Tìm kiếm theo tên" ID="txtTimKiem" runat="server" />
            <asp:Button CausesValidation="false" ID="btnTimKiem" CssClass="button" Text="Tìm kiếm" runat="server" OnClick="btnTimKiem_Click" />
            <asp:Label ID="lblTK" runat="server"/>
            <asp:GridView ID="gvChucVu_ad" runat="server" class="col-12 col-m-12 col-sm-12"
                AutoGenerateColumns="false" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
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
                    <asp:BoundField HeaderText="Mã chức vụ" DataField="MaChucVu" />
                    <asp:BoundField HeaderText="Tên chức vụ" DataField="TenChucVu" />

                    <asp:TemplateField HeaderText="Sửa chức vụ">
                        <ItemTemplate>
                            <asp:Button CausesValidation="false" CssClass="button b" ID="btnSuaChucVu" OnCommand="suaChucVu" CommandName="suaChucVu" Text="Sửa chức vụ"
                                CommandArgument='<%# Bind("MaChucVu") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Xoá chức vụ">
                        <ItemTemplate>
                            <asp:Button CausesValidation="false" CssClass="button r" ID="btnXoaChucVu" CommandName="xoaChucVu" Text="Xoá chức vụ"
                                CommandArgument='<%# Bind("MaChucVu") %>' runat="server"
                                OnCommand="quanLyXoa"
                                OnClientClick="return confirm('Xác nhận xoá ?')" />
                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>
            </asp:GridView>

            <h3>Thêm chức vụ</h3>
            <table class="col-11 col-m-11 col-sm-11">
                <tr>
                    <td>Mã chức vụ: </td>
                    <td>
                        <asp:TextBox CssClass="inp" ID="txtMa" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rxtTen" runat="server" ControlToValidate="txtMa"
                        ErrorMessage="Mã không được để trống!" ForeColor="red"/></td>
                </tr>
                <tr>
                    <td>Tên chức vụ: </td>
                    <td>
                        <asp:TextBox CssClass="inp" ID="txtTen" runat="server" /></td>
                    <td><asp:RequiredFieldValidator ID="rxMa" runat="server" ControlToValidate="txtTen"
                        ErrorMessage="Tên không được để trống!" ForeColor="red"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button CausesValidation="true" Width="100%" ID="btnThem" CssClass="button" runat="server" Text="Thêm" OnClick="btnThem_Click" />
                    </td>
                </tr>
            </table>






        </div>
    </div>





    <asp:Label ID="lblThongBao" runat="server" />

    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.chucvu').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
