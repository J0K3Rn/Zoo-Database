<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TicketBooth.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 10px">
            <label style="margin-left: 10px">TICKET BOOTH FORM:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="BoothID" runat="server"/>
            <label style="margin-left: 10px">BoothID:</label>
        </div>
        <div style="margin: 10px">
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click"/>
        </div>
    </form>
</body>
</html>
