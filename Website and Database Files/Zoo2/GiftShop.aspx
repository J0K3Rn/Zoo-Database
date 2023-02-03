<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GiftShop.aspx.cs" Inherits="Zoo2.GiftShop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label style="margin-left: 50px">ENTER NEW GIFTSTHOP INTO DATABASE</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="GiftshopID" runat="server"/>
            <label style="margin-left: 10px">Giftshop ID: </label>
        </div>
        <div style="margin: 10px"> 
            <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Submit"/>
            <asp:Button ID="GetGiftshops" runat="server" OnClick="GetButton_Click" Text="Get All Giftshops"/>
        </div>
        <div>
            <asp:Literal ID="reportTable" runat ="server" />
        </div>
    </form>
</body>
</html>
