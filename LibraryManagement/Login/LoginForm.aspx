<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="LibraryManagement.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập hệ thống</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="/css/style1.css" type="text/css" rel="stylesheet" />
    <link href="/css/nackbarCustom.css" type="text/css" rel="stylesheet" />
</head>
<body>
<div class="bg-img">
  <form runat="server" id="form1" class="container">
    <h1>Login</h1>

    <label for="email"><b>Email</b></label>
      <asp:TextBox placeholder="Enter Password" type="text" ID="txtEmail" name="email" runat="server" />

    <label for="psw"><b>Password</b></label>
      <asp:TextBox ID="txtPass" type="password" runat="server" placeholder="Enter Password" name="psw"/>

      <asp:ScriptManager runat="server">

        </asp:ScriptManager>

       <asp:UpdatePanel runat="server" ID="UpdatePanel1">
    <ContentTemplate>
        <div>
            <asp:Button ID="btnLogin" Text="Login" runat="server" type="submit" class="btn" OnClick="btnLogin_Click"/>
        </div>

        <div id="snackbar">
            <asp:Label runat="server" ID="Snack" />
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

  
  </form>
</div>
</body>
</html>
