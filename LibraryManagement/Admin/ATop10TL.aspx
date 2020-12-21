<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ATop10TL.aspx.cs" Inherits="LibraryManagement.Admin.ATop10TL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h1>Top 10 tài liệu mượn nhiều nhất</h1>
    <p>&nbsp;</p>
    <h3>Thư viện trường Đại học Công nghiệp Hà Nội</h3>
    
    <p>Ngày lập: <asp:Label ID="txtNgayLap" runat="server" /></p>

    <p>Nguời lập: <asp:Label ID="txtNguoiLap" runat="server" /></p>
    <p>&nbsp;</p>
    <asp:GridView ID="gridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <p>&nbsp;</p>
    <h3>Chọn thời gian:</h3>
    Bắt đầu: <asp:TextBox ID="txtDate1" TextMode="Date" runat="server" OnTextChanged="txtDate1_TextChanged" />
    Kết thúc:<asp:TextBox ID="txtDate2" TextMode="Date" runat="server" OnTextChanged="txtDate2_TextChanged" />
    <p>&nbsp;</p>
    <asp:Button ID="btnXem" runat="server" Text ="Xem" OnClick="btnXem_Click" />
    <asp:Button ID="btnInPdf" runat="server" Text ="Xuất file pdf" />
    <asp:Button ID="btnInWord" runat="server" Text ="Xuất file Word" />
    
    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.top10Sach').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
