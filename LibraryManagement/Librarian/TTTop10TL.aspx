﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/SiteLibra.Master" AutoEventWireup="true" CodeBehind="TTTop10TL.aspx.cs" Inherits="LibraryManagement.Librarian.TTTop10TL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de2" runat="server">
    Top 10 tài liệu mượn nhiều nhất
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">
    <link href="/css/giangp.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung2" runat="server">


    <h3>Thư viện trường Đại học Công nghiệp Hà Nội</h3>

    <p>Ngày lập:
        <asp:Label ID="txtNgayLap" runat="server" /></p>

    <p>Nguời lập:
        <asp:Label ID="txtNguoiLap" runat="server" /></p>

    <div style="margin: 0 auto;" class="col-10 col-m-10 col-sm-10">
        <div class="card">
            <div class="card-header">
                <h3>Top 10 tài liệu mượn nhiều nhất
                </h3>
            </div>
            <asp:GridView class="col-12 col-m-12 col-sm-12" ID="gridView1" runat="server" AutoGenerateColumns="False"
                BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
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
                    <asp:BoundField HeaderText="Số lần mượn" DataField="SoLanMuon" />
                    <asp:BoundField HeaderText="Tên sách" DataField="TenSach" />
                    <asp:BoundField HeaderText="Tên thể loại" DataField="TenTheLoai" />
                    <asp:BoundField HeaderText="Ghi chú" DataField="GhiChu" />
                </Columns>
            </asp:GridView>
            <h4>Chọn thời gian:</h4>
            Bắt đầu:
            <asp:TextBox ID="txtDate1" CssClass="inp" Width="30%" TextMode="Date" runat="server" OnTextChanged="txtDate1_TextChanged" />
            Kết thúc:<asp:TextBox ID="txtDate2" CssClass="inp" Width="30%" TextMode="Date" runat="server" OnTextChanged="txtDate2_TextChanged" />
            <asp:Button ID="btnXem" CssClass="button" runat="server" Text="Xem" OnClick="btnXem_Click" />
            <br />


        </div>
    </div>





    <asp:Button ID="btnInPdf" CssClass="button g" runat="server" Text="Xuất file Pdf" OnClick="btnInPdf_Click" />
    <asp:Button ID="btnInWord" runat="server" CssClass="button g" Text="Xuất file Excel" OnClick="btnInWord_Click" />

    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.muonnhieunhat').toggleClass('active')
        })
    </script>
</asp:Content>
