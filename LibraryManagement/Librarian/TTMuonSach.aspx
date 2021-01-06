<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/SiteLibra.Master" AutoEventWireup="true" CodeBehind="TTMuonSach.aspx.cs" Inherits="LibraryManagement.Librarian.TTMuonSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de2" runat="server">
    Mượn sách
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head2" runat="server">

    <link href="/css/style_muon_sach2.css" type="text/css" rel="stylesheet" />
    <link href="/css/giangp1.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung2" runat="server">

    <div id="container">
        <div id="dau">
            <h3>Quản lý mượn sách</h3>
        </div>
        <div id="than">
            <div id="left">



                <div class="col-12 col-m-12 col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <h3>Thông tin phiếu mượn
                            </h3>
                        </div>

                        <table>
                            <tr>
                                <td>
                                    <asp:Label Text="Mã phiếu:" runat="server" /></td>
                                <td>
                                    <asp:TextBox CssClass="inp" ID="txtMaPhieu" runat="server" /></td>
                                <td>
                                    <asp:ImageButton ImageUrl="/images/se11.png" runat="server" ID="btnTimKiemMaPhieu" OnClick="btnTimKiemMaPhieu_Click" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label Text="Độc giả:" runat="server" /></td>
                                <td colspan="2">
                                    <asp:DropDownList CssClass="inp" ID="drDocGia" runat="server" />
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:Label Text="Ngày mượn:" runat="server" /></td>
                                <td colspan="2">
                                    <asp:TextBox CssClass="inp" ID="txtNgayMuon" TextMode="Date" runat="server">1/1/1991</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label Text="Nhân viên" runat="server" /></td>
                                <td colspan="2">
                                    <asp:DropDownList CssClass="inp" ID="drNhanVien" runat="server" />
                                </td>
                            </tr>

                        </table>
                        <table>
                            <tr>


                                <td>
                                    <asp:Button ID="btnNhapLai" CssClass="button g" Text="Nhập lại" runat="server" OnClick="btnNhapLai_Click" /></td>
                                <td>
                                    <asp:Button ID="btnTaoPhieu" CssClass="button" Text="Tạo phiếu" runat="server" OnClick="btnTaoPhieu_Click" /></td>
                                <td rowspan="2">
                                    <asp:ImageButton ImageUrl="/images/printer.png" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnXoa" Text="Xoá phiếu" CssClass="button r" runat="server" OnClick="btnXoa_Click" /></td>
                                <td>
                                    <asp:Button ID="btnSua" Text="Sửa phiếu" CssClass="button z" runat="server" OnClick="btnSua_Click" /></td>
                            </tr>
                        </table>





                    </div>
                </div>




                <!-- end left -->
            </div>
            <div id="right">




                <div class="col-12 col-m-12 col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            <h3>Thêm chi tiết tài liệu mượn
                            </h3>
                        </div>

                        <table>
                            <tr>
                                <td>
                                    <asp:Label Text="Sách:" runat="server" /></td>
                                <td>
                                    <asp:DropDownList CssClass="inp" ID="drSach" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label Text="Số lượng mượn:" runat="server" /></td>
                                <td>
                                    <asp:TextBox CssClass="inp" ID="txtSLMuon" TextMode="Number" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label Text="Ngày trả:" runat="server" /></td>
                                <td>
                                    <asp:TextBox CssClass="inp" ID="txtNgayTra" TextMode="Date" runat="server" /></td>
                            </tr>
                        </table>

                        <table>
                            <tr>
                                <td>
                                    <asp:Button runat="server" ID="de_btnNhap" Text="Nhập" CssClass="button g" OnClick="de_btnNhap_Click" />
                                    <asp:Button runat="server" ID="de_btnChoMuon" Text="Cho mượn" CssClass="button" OnClick="de_btnChoMuon_Click" />
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>

















                <!-- end right-->
            </div>
        </div>
        <div id="cuoi">


            <div class="col-12 col-m-12 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h3>Danh sách chi tiết tài liệu mượn
                        </h3>
                    </div>


                    <asp:GridView ID="GridView1" class="col-12 col-m-12 col-sm-12" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px"
                        CellPadding="3" CellSpacing="1" AutoGenerateColumns="False" GridLines="None">
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#C6C3C6" />
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

                </div>
            </div>


        </div>
    </div>
    <p>&nbsp;</p>



    <p>&nbsp;</p>


    <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.muonsach').toggleClass('active')
        })
    </script>
</asp:Content>
