<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SuaDoiTuong.aspx.cs" Inherits="LibraryManagement.Admin.Edit.SuaDoiTuong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="tieu_de" runat="server">
    Sửa đối tượng
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="/css/giangp.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="noi_dung" runat="server">


    <div class="col-12 col-m-12 col-sm-12">
        <div class="card">
            <div class="card-header">
                <h3>Sửa đối tượng
                </h3>
            </div>

            <asp:Table class="col-10 col-m-10 col-sm-10" runat="server">
                <asp:TableRow>
                    <asp:TableCell>Mã đối tượng: </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox CssClass="inp" Enabled="false" ID="txtMaDT" runat="server" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Tên đối tượng: </asp:TableCell><asp:TableCell>
                        <asp:TextBox CssClass="inp" ID="txtTenDT" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                           <asp:RequiredFieldValidator ID="rq2" runat="server" ControlToValidate="txtTenDT" Display="Dynamic"
                        ErrorMessage="Tên không được để trống!" ForeColor="red"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button CausesValidation="false" CssClass="button g" ID="btnQuayLai" Text="Quay lại" runat="server" OnClick="btnQuayLai_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button CausesValidation="true" ID="btnSua" CssClass="button" Width="100%" Text="Sửa" runat="server" OnClick="btnSua_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Label ID="lbThongBao" runat="server" />


        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
