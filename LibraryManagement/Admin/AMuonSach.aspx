<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AMuonSach.aspx.cs" Inherits="LibraryManagement.AMuonSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Quản lý mượn sách
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="/css/style_muon_sach.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    
    <div id="container">
        <div id="dau"><h2>Quản lý mượn sách</h2></div>
        <div id="than">
            <div id="left">
                <h3>Thông tin phiếu mượn</h3>
    <table>
        <tr>
            <td><asp:Label Text="Mã phiếu:" runat="server" /></td>
            <td><asp:TextBox ID="txtMaPhieu" runat="server" /></td>
            <td><asp:ImageButton ImageUrl="/images/se2.png" runat="server" ID="btnTimKiemMaPhieu" OnClick="btnTimKiemMaPhieu_Click" /></td>
        </tr>
        <tr>
            <td><asp:Label Text="Độc giả:" runat="server" /></td>
            <td colspan="2">
                <asp:DropDownList ID="drDocGia" runat="server" />
                </td>
        </tr>
        
        <tr>
            <td><asp:Label Text="Ngày mượn:" runat="server" /></td>
            <td colspan="2"><asp:TextBox ID="txtNgayMuon" TextMode="Date" runat="server" >1/1/1991</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><asp:Label Text="Nhân viên" runat="server" /></td>
            <td colspan="2">
                <asp:DropDownList ID="drNhanVien" runat="server" />
            </td>
        </tr>
        
    </table>
    <table>
        <tr>



            <td><asp:Button ID="btnNhapLai" Text="Nhập lại" runat="server" OnClick="btnNhapLai_Click" /></td>
            <td><asp:Button ID="btnTaoPhieu" Text="Tạo phiếu" runat="server" OnClick="btnTaoPhieu_Click" /></td>
            <td rowspan="2"><asp:ImageButton ImageUrl="/images/printer.png" runat="server"/></td>
        </tr>
        <tr>
            <td><asp:Button ID="btnXoa" Text="Xoá" runat="server" OnClick="btnXoa_Click" /></td>
            <td><asp:Button ID="btnSua" Text="Sửa" runat="server" /></td>
        </tr>
    </table>
            </div>
            <div id="right">
                <h3>Thêm chi tiết tài liệu mượn</h3>

                <table>
                    <tr>
                        <td><asp:Label Text="Sách:" runat="server" /></td>
                        <td><asp:DropDownList ID="drSach" runat="server" /></td>
                    </tr>
                    <tr>
                        <td><asp:Label Text="Số lượng mượn:" runat="server" /></td>
                        <td><asp:TextBox ID="txtSLMuon" TextMode="Number" runat="server" /></td>
                    </tr>
                    <tr>
                        <td><asp:Label Text="Ngày trả:" runat="server" /></td>
                        <td><asp:TextBox ID="txtNgayTra" TextMode="Date" runat="server" /></td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <td>
                             <asp:Button runat="server" ID="de_btnNhap" Text="Nhập" CssClass="submit" OnClick="de_btnNhap_Click" />
                            <asp:Button runat="server" ID="de_btnChoMuon" Text="Cho mượn" OnClick="de_btnChoMuon_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="cuoi">
            <h3>Chi tiết sách mượn</h3>
    <br />
    <asp:GridView ID="GridView2" AutoGenerateColumns="false"
        runat="server" BackColor="White" BorderColor="White"  BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
            <asp:BoundField DataField="a" HeaderText="Mã tài liệu" />
            <asp:BoundField DataField="b" HeaderText="Tên tài liệu" />
            <asp:BoundField DataField="c" HeaderText="Số lượng mượn" />
            <asp:BoundField DataField="d" HeaderText="Ngày trả" />
            <asp:BoundField DataField="e" HeaderText="Trạng thái" />
        </Columns>
    </asp:GridView>


            <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"  
            CellPadding="3" CellSpacing="2" AutoGenerateColumns="False">  
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />  
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />  
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />  
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />  
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />  
            <SortedAscendingCellStyle BackColor="#FFF1D4" />  
            <SortedAscendingHeaderStyle BackColor="#B95C30" />  
            <SortedDescendingCellStyle BackColor="#F1E5CE" />  
            <SortedDescendingHeaderStyle BackColor="#93451F" />  
            <Columns>  
                <asp:BoundField DataField="a" HeaderText="Mã tài liệu" />
            <asp:BoundField DataField="b" HeaderText="Tên tài liệu" />
            <asp:BoundField DataField="c" HeaderText="Số lượng mượn" />
            <asp:BoundField DataField="d" HeaderText="Ngày trả" />
            <asp:BoundField DataField="e" HeaderText="Trạng thái" />  
            </Columns>  
        </asp:GridView>


        </div>
    </div>
    <p>&nbsp;</p>
    


    <p>&nbsp;</p>
    


    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.muonsach').toggleClass('active')
            //console.log(1);
        })
    </script>
</asp:Content>
