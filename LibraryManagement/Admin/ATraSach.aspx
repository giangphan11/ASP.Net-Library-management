<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ATraSach.aspx.cs" Inherits="LibraryManagement.ATraSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Quản lý trả sách
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="/css/style_tra_sach.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">

    <div id="container">
        <div id="idHead">
            <h2>Quản lý trả sách</h2>
        </div>
        <div id="idBody">
            <div id="left">
                <asp:Label Text="Mã độc giả" runat="server" />
                <asp:TextBox ID="txtMaDG" runat="server" />
                <asp:Button ID="btnTimKiem" Text="Tìm kiếm" runat="server" OnClick="btnTimKiem_Click" />
                <asp:Label ID="lbThongBao" runat="server" />
            </div>
            <div id="right">
                <h3>Thông tin chi tiết phiếu</h3>
                <table>
                    <tr>
                        <td>Mã phiếu:</td>
                        <td><asp:Label ID="lbMaPhieu" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Mã độc giả:</td>
                        <td><asp:Label ID="lbMaDocGia" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Tên độc giả:</td>
                        <td><asp:Label ID="lbTenDocGia" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Ngày mượn:</td>
                        <td><asp:Label ID="lbNgayMuon" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Mã nhân viên:</td>
                        <td><asp:Label ID="lbMaNV" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Tên nhân viên:</td>
                        <td><asp:Label ID="lbTenNV" runat="server" /></td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="tb1">
            <h3>Thông tin các phiếu mượn</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"  
            CellPadding="3" CellSpacing="2" >  
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />  
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />  
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />  
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />  
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />  
            <SortedAscendingCellStyle BackColor="#FFF1D4" />  
            <SortedAscendingHeaderStyle BackColor="#B95C30" />  
            <SortedDescendingCellStyle BackColor="#F1E5CE" />  
            <SortedDescendingHeaderStyle BackColor="#93451F" />  
             
        </asp:GridView> 

        </div>
        <div id="tb2">
            <h3>Thông tin các tài liệu đang mượn</h3>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView22_SelectedIndexChanged"  
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"  
            CellPadding="3" CellSpacing="2" >  
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />  
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />  
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />  
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />  
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />  
            <SortedAscendingCellStyle BackColor="#FFF1D4" />  
            <SortedAscendingHeaderStyle BackColor="#B95C30" />  
            <SortedDescendingCellStyle BackColor="#F1E5CE" />  
            <SortedDescendingHeaderStyle BackColor="#93451F" />  
             
        </asp:GridView> 
        </div>
        <div id="tra">
            <table>
                <tr>
                    <td>Mã phiếu:</td>
                    <td><asp:Label ID="txtMaPhieu" runat="server" /></td>
                </tr>
                <tr>
                    <td>Mã tài liệu:</td>
                    <td><asp:Label ID="txtMaSach" runat="server" /></td>
                </tr>
                <tr>
                    <td>Số lượng:</td>
                    <td><asp:Label ID="txtSoLuongTra" runat="server" /></td>
                </tr>
                <tr>
                    <td>Tên sách:</td>
                    <td><asp:Label ID="txtTenSach" runat="server" /></td>
                </tr>
            </table>
            <asp:Button ID="btnTraSach" runat="server" Text="Trả sách" OnClick="btnTraSach_Click" />

        </div>
        <div id="fter"></div>
    </div>



    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.trasach').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
