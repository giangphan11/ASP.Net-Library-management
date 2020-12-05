﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLDocGia.aspx.cs" Inherits="LibraryManagement.Admin.AQLDocGia" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">Độc giả
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h2>Quản lý độc giả</h2>
    <asp:GridView ID="gvDocGia_a" AutoGenerateColumns="false" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
        <Columns>
            <asp:BoundField HeaderText="Mã" DataField="MaDG" />
            <asp:BoundField HeaderText="Tên" DataField="TenDG" />
            <asp:BoundField HeaderText="Giới tính" DataField="GT" />
            <asp:BoundField HeaderText="Ngày sinh" DataField="NgaySinh" />
            <asp:BoundField HeaderText="Mã đối tượng" DataField="MaDT" />
            <asp:BoundField HeaderText="Ngày cấp" DataField="NgayCap" />
            <asp:BoundField HeaderText="Ngày hết hạn" DataField="NgayGiaHan" />
            <asp:TemplateField HeaderText="Xoá độc giả">
                <ItemTemplate>
                    <asp:Button ID="btnXoaDocGia" runat="server" Text="Xoá" OnCommand="xuLyXoa" 
                        OnClientClick="return confirm('Xác nhận xoá?')"
                        CommandName="xoa"
                        CommandArgument='<%#Bind("MaDG") %>'/>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Sửa độc giả">
                <ItemTemplate>
                    <asp:Button ID="btnSuaDocGia" runat="server" Text="Sửa" OnCommand="xuLySua" 
                        CommandName="sua"
                        CommandArgument='<%#Bind("MaDG") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="lblNo" runat="server" />
    <br />
    <h2>Thêm độc giả</h2>
    <table>
        <tr>
            <td>Mã độc giả:</td>
            <td><asp:TextBox ID="txtMaDG" runat="server" /></td>
        </tr>
        <tr>
            <td>Tên độc giả:</td>
            <td><asp:TextBox ID="txtTen" runat="server" /></td>
        </tr>
        <tr>
            <td>Giới tính:</td>
            <td>
                <asp:RadioButtonList runat="server" ID="radGT">
                    <asp:ListItem Text="Nam" Selected="True" Value="nam" />
                    <asp:ListItem Text="Nữ" Value="nu" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
            <td>Ngày sinh:</td>
            <td><asp:TextBox ID="txtNgaySinh" runat="server" />
                
                <ajaxToolkit:CalendarExtender
                    ID="CalendarExtender1" 
                    Format="dd/MM/yyyy"
                TargetControlID="txtNgaySinh"
                PopupButtonID="ibtCal" runat="server" TodaysDateFormat="dd/MM/yyyy" SelectedDate="1/1/1999" />
                <asp:ImageButton ID="ibtCal" runat="server" Height="32px"
                    ImageUrl="/assets/calendar.png" Width="32px"
                    onclick="ibtCal_Click" />
            </td>
        </tr>
        <tr>
            <td>Đối tượng: </td>
            <td><asp:DropDownList ID="dropDownDoiTuong" runat="server" /></td>
        </tr>
        <tr>
            <td>Ngày cấp:</td>
            <td><asp:TextBox ID="txtNgayCap" runat="server" />
                <ajaxToolkit:CalendarExtender
                    ID="CalendarExtender2" 
                    Format="dd/MM/yyyy"
                TargetControlID="txtNgayCap"
                PopupButtonID="ImageButton1" runat="server" TodaysDateFormat="dd/MM/yyyy" />
                <asp:ImageButton ID="ImageButton1" runat="server" Height="32px"
                    ImageUrl="/assets/calendar.png" Width="32px"
                    onclick="ibtCal2_Click" />
            </td>
        </tr>
        <tr>
            <td>Ngày hết hạn: </td>
            <td><asp:TextBox ID="txtNgayHetHan" runat="server" />
                <ajaxToolkit:CalendarExtender
                    ID="CalendarExtender3" 
                    Format="dd/MM/yyyy"
                TargetControlID="txtNgayHetHan"
                PopupButtonID="ImageButton2" runat="server" TodaysDateFormat="dd/MM/yyyy" />
                <asp:ImageButton ID="ImageButton2" runat="server" Height="32px"
                    ImageUrl="/assets/calendar.png" Width="32px"
                    onclick="ibtCal3_Click" />
            </td>
        </tr>
    </table>
    <asp:Button Text="Thêm" ID="btnThem" runat="server" />


     <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.docgia').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
