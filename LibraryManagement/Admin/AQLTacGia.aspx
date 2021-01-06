<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLTacGia.aspx.cs" Inherits="LibraryManagement.Admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Tác giả
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">

    <div class="col-12 col-m-12 col-sm-12">
        <div class="card">
            <div class="card-header">
                <h3>Quản lý tác giả
                </h3>
            </div>


            <asp:GridView AutoGenerateColumns="false" style="margin:0 auto;" class="col-9 col-m-9 col-sm-9" ID="GridView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" GridLines="None" CellSpacing="1">
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
                <Columns>
                    <asp:BoundField HeaderText ="Mã" DataField="MaTG" />
                    <asp:BoundField HeaderText ="Tên" DataField="TenTG" />
                    <asp:ImageField ControlStyle-Width="100" ControlStyle-Height="100" HeaderText="Ảnh" DataImageUrlField="Anh" />
                </Columns>
            </asp:GridView>

            <h3>Thêm tác giả</h3>
            <table class="col-9 col-m-9 col-sm-9">
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Mã:" /></td>
                    <td>
                        <asp:TextBox CssClass="inp" ID="txtMa" runat="server" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtMa" Display="Dynamic"
                        ErrorMessage="Năm xuất bản được để trống!" ForeColor="red"/>
                </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" Text="Tên:" /></td>
                    <td>
                        <asp:TextBox CssClass="inp" ID="txtTen" runat="server" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtTen" Display="Dynamic"
                        ErrorMessage="Năm xuất bản được để trống!" ForeColor="red"/>
                </td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Ảnh"/></td>
                    <td> <asp:FileUpload ID="fileAnh" runat="server" CssClass="inp" /> </td>
                </tr>
                <tr>
                    <td>
                         <asp:Button ID="btnQuaylai" CausesValidation="false" Text="Quay lại" CssClass="button g" runat="server" OnClick="btnQuaylai_Click" />
                    </td>
                    <td >
                        <asp:Button Width="100%" ID="btnThem" CausesValidation="true" CssClass="button" Text="Thêm" runat="server" OnClick="btnThem_Click" />
                    </td>
                </tr>
            </table>
           
            




        </div>
    </div>


</asp:Content>
