<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AQLDocGia.aspx.cs" Inherits="LibraryManagement.Admin.AQLDocGia" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">Độc giả
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="/css/giangp.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">

    <div class="col-12 col-m-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<h3>
							Quản lý độc giả
						</h3>
					</div>
					
					
					<asp:TextBox CssClass="search half" placeholder="Tìm kiếm theo tên" ID="txtTimKiem" runat="server" />
    <asp:Button CausesValidation="false" ID="btnTimKiem" Text="Tìm kiếm" CssClass="button" runat="server" OnClick="btnTimKiem_Click" />
        <asp:Label ID="lblTK" runat="server" />
    <asp:GridView ID="gvDocGia_a" AutoGenerateColumns="false" runat="server" class="col-12 col-m-12 col-sm-12"
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
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
            <asp:ImageField ControlStyle-Width="100" ControlStyle-Height = "100" HeaderText="Ảnh" DataImageUrlField="Anh" />
            
            <asp:TemplateField HeaderText="Sửa độc giả">
                <ItemTemplate>
                    <asp:Button CausesValidation="false" ID="btnSuaDocGia" runat="server" Text="Sửa" OnCommand="xuLySua" 
                        CommandName="sua" CssClass="button b"
                        CommandArgument='<%#Bind("MaDG") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Xoá độc giả">
                <ItemTemplate>
                    <asp:Button CausesValidation="false" CssClass="button r" ID="btnXoaDocGia" runat="server" Text="Xoá" OnCommand="xuLyXoa" 
                        OnClientClick="return confirm('Xác nhận xoá?')"
                        CommandName="xoa"
                        CommandArgument='<%#Bind("MaDG") %>'/>
                </ItemTemplate>
            </asp:TemplateField>

            
        </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="lblNo" runat="server" />
    <h3>Thêm độc giả</h3>
    <table class="col-9 col-m-9 col-sm-9">
        <tr>
            <td>Mã độc giả:</td>
            <td><asp:TextBox CssClass="inp" ID="txtMaDG" runat="server" /></td>
            <td>
                <asp:RequiredFieldValidator ID="rq1" runat="server" ControlToValidate="txtMaDG" Display="Dynamic"
                        ErrorMessage="Mã được để trống!" ForeColor="red"/>
            </td>
        </tr>
        <tr>
            <td>Tên độc giả:</td>
            <td><asp:TextBox CssClass="inp" ID="txtTen" runat="server" /></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTen" Display="Dynamic"
                        ErrorMessage="Tên được để trống!" ForeColor="red"/>
            </td>
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
            <td><asp:TextBox CssClass="inp" ID="txtNgaySinh" runat="server" />
                
                <ajaxToolkit:CalendarExtender
                    ID="CalendarExtender1" 
                    Format="dd/MM/yyyy"
                TargetControlID="txtNgaySinh"
                PopupButtonID="ibtCal" runat="server" TodaysDateFormat="dd/MM/yyyy" SelectedDate="1/1/1999" />
                <asp:ImageButton ID="ibtCal" runat="server" Height="32px"
                    ImageUrl="/assets/calendar1.png" Width="32px"
                    onclick="ibtCal_Click" />
            </td>
        </tr>
        <tr>
            <td>Đối tượng:  </td>
            <td><asp:DropDownList CssClass="drop" ID="dropDownDoiTuong" runat="server" /></td>
        </tr>
        <tr>
            <td>Ngày cấp:</td>
            <td><asp:TextBox CssClass="inp" ID="txtNgayCap" runat="server" />
                <ajaxToolkit:CalendarExtender
                    ID="CalendarExtender2" 
                    Format="dd/MM/yyyy"
                TargetControlID="txtNgayCap"
                PopupButtonID="ImageButton1" runat="server" TodaysDateFormat="dd/MM/yyyy" />
                <asp:ImageButton ID="ImageButton1" runat="server" Height="32px"
                    ImageUrl="/assets/calendar1.png" Width="32px"
                    onclick="ibtCal2_Click" />
            </td>
        </tr>
        <tr>
            <td>Ngày hết hạn:  </td>
            <td><asp:TextBox CssClass="inp"  ID="txtNgayHetHan" runat="server" />
                <ajaxToolkit:CalendarExtender
                    ID="CalendarExtender3" 
                    Format="dd/MM/yyyy"
                TargetControlID="txtNgayHetHan"
                PopupButtonID="ImageButton2" runat="server" TodaysDateFormat="dd/MM/yyyy" />
                <asp:ImageButton ID="ImageButton2" runat="server" Height="32px"
                    ImageUrl="/assets/calendar1.png" Width="32px"
                    onclick="ibtCal3_Click" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTen" Display="Dynamic"
                        ErrorMessage="Ngày hết hạn không được để trống!" ForeColor="red"/>
            </td>
        </tr>
        <tr>
            <td>Ảnh: </td>
            <td><asp:FileUpload CssClass="inp" runat="server" ID="fileAnhUpload" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button CausesValidation="true" Width="100%" Text="Thêm" ID="btnThem" runat="server" CssClass="button" OnClick="btnThem_Click" />
            </td>
        </tr>
    </table>
    <asp:Label runat="server" ID="lblKetQua" />
    
				</div>
			</div>
    
     <script src="/scripts/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $('.docgia').toggleClass('active')
            console.log(1);
        })
    </script>
</asp:Content>
