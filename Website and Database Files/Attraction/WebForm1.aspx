<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Attraction.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label style="margin-left: 50px">ATTRACTION</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="Name" runat="server"/>
            <label style="margin-left: 10px">Attraction Name:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="ManagerID" runat="server" />
            <label style="margin-left: 10px">Manager ID:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="AnimalID" runat="server"/>
            <label style="margin-left: 10px">Animal ID:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="Price" runat="server"  placeholder="yyyy-mm-dd"/>
            <label style="margin-left: 10px">Price:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="UpkeepCost" runat="server"  />
            <label style="margin-left: 10px">Upkeep Cost:</label>
        </div>
        <div style="margin: 10px"> 
            <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Submit"/>
        </div>
    </form>
</body>
</html>
