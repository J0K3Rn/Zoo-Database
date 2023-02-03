<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemUpdate.aspx.cs" Inherits="ItemUpdate.ItemUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 10px></divstyle="margin:>
            <p>Item Was Purchased.</p>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="updateid" runat="server"/>
            <label style="margin-left: 10px">Item ID</label>
        </div>
        <div style="margin: 10px">
            <asp:Button runat="server" Text="Update" OnClick="Update_Click"/>
            <asp:Literal ID="updateMessage" runat ="server" />
        </div>
    </form>
</body>
</html>
