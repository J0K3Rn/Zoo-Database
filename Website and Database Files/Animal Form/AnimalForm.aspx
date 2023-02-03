<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnimalForm.aspx.cs" Inherits="Zoo2.AnimalForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label style="margin-left: 50px">ANIMAL FORM</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="Name" runat="server"/>
            <label style="margin-left: 10px">Animal Name: </label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="AnimalID" runat="server" />
            <label style="margin-left: 10px">Animal ID:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="Breed" runat="server"/>
            <label style="margin-left: 10px">Breed:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="ArrivalDate" runat="server"  placeholder="yyyy-mm-dd"/>
            <label style="margin-left: 10px">Arrival Date:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="Species" runat="server"  />
            <label style="margin-left: 10px">Species:</label>
        </div>
        <div style="margin: 10px">            
            <asp:TextBox ID="Diet" runat="server" />
            <label style="margin-left: 10px">Diet:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="Sex" runat="server" />
            <label style="margin-left: 10px">Sex:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="DOB" runat="server"  placeholder="yyyy-mm-dd" />
            <label style="margin-left: 10px">DOB:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="CarerID" runat="server"/>
            <label style="margin-left: 10px">CarerID:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="AttractionName" runat="server"/>
            <label style="margin-left: 10px">Attraction Name:</label>
        </div>
        <div style="margin: 10px"> 
            <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Submit"/>
        </div>
    </form>
</body>
</html>
