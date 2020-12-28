<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaDocGia.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaDocGia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Sửa độc giả
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">
    <h3>Sửa độc giả</h3>
    <asp:Image ID="imgDocGia" Width="300px" Height="300px" runat="server" />
    <table>
        <tr>
            <td>Mã độc giả:</td>
            <td><asp:TextBox Enabled="false" ID="txtMaDG" runat="server" /></td>
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
                PopupButtonID="ImageButton1" runat="server"  />
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
        <tr>
            <td>Ảnh: </td>
            <td><asp:FileUpload runat="server" ID="fileAnhUpload" /></td>
        </tr>
    </table>
    <asp:Label ID="lblThongbao" runat="server" />
    <br />
    <asp:Button ID="btnSua" runat="server" Text="Sửa" OnClick="btnSua_Click" />
    <asp:Button ID="btnQuayLai" runat="server" Text="Quay lại" OnClick="btnQuayLai_Click" />
</asp:Content>
