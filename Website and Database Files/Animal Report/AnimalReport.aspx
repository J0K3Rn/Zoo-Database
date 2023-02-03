<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnimalReport.aspx.cs" Inherits="Zoo2.AnimalReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label style="margin-left: 50px">ANIMAL REPORT</label>
            <p>Enter the fields you want to search by. Click the left checkbox to show the attributes.</p>
        </div>
        <div style="margin: 10px">
            <asp:CheckBox ID="includename" runat="server"/>
            <asp:TextBox ID="Name" runat="server"/>
            <label style="margin-left: 10px">Animal Name: </label>
        </div>
        <div style="margin: 10px">
            <asp:CheckBox ID="includeanimalid" runat="server"/>
            <asp:TextBox ID="AnimalID" runat="server" />
            <label style="margin-left: 10px">Animal ID:</label>
        </div>
        <div style="margin: 10px">
            <asp:CheckBox ID="includebreed" runat="server"/>
            <asp:TextBox ID="Breed" runat="server"/>
            <label style="margin-left: 10px">Breed:</label>
        </div>
        <div style="margin: 10px">
            <asp:CheckBox ID="includearrivaldate" runat="server"/>
            <asp:TextBox ID="ArrivalDate" runat="server"  placeholder="yyyy-mm-dd"/>
            <label style="margin-left: 10px">Arrival Date:</label>
            <label style="margin-left: 10px">Before Date:</label>
            <asp:CheckBox ID="arrivalb" runat="server"/>
            <label style="margin-left: 10px">After Date:</label>
            <asp:CheckBox ID="arrivala" runat="server"/>
        </div>
        <div style="margin: 10px">
            <asp:CheckBox ID="includespecies" runat="server"/>
            <asp:TextBox ID="Species" runat="server"  />
            <label style="margin-left: 10px">Species:</label>
        </div>
        <div style="margin: 10px">  
            <asp:CheckBox ID="includediet" runat="server"/>
            <asp:TextBox ID="Diet" runat="server" />
            <label style="margin-left: 10px">Diet:</label>
        </div>
        <div style="margin: 10px">
            <asp:CheckBox ID="includesex" runat="server"/>
            <asp:TextBox ID="Sex" runat="server" />
            <label style="margin-left: 10px">Sex:</label>
        </div>
        <div style="margin: 10px">
            <asp:CheckBox ID="includedob" runat="server"/>
            <asp:TextBox ID="DOB" runat="server"  placeholder="yyyy-mm-dd" />
            <label style="margin-left: 10px">DOB:</label>
            <label style="margin-left: 10px">Before Date:</label>
            <asp:CheckBox ID="dobb" runat="server"/>
            <label style="margin-left: 10px">After Date:</label>
            <asp:CheckBox ID="doba" runat="server"/>
        </div>
        <div style="margin: 10px">
            <asp:CheckBox ID="includecarerid" runat="server"/>
            <asp:TextBox ID="CarerID" runat="server"/>
            <label style="margin-left: 10px">CarerID:</label>
        </div>
        <div style="margin: 10px">
            <asp:CheckBox ID="includeattractionname" runat="server"/>
            <asp:TextBox ID="AttractionName" runat="server"/>
            <label style="margin-left: 10px">Attraction Name:</label>
        </div>
        <div style="margin: 10px">
            <asp:CheckBox ID="includedeathdate" runat="server"/>
            <asp:TextBox ID="DeathDate" runat="server"  placeholder="yyyy-mm-dd" />
            <label style="margin-left: 10px">Deceased Date:</label>
            <label style="margin-left: 10px">Before Date:</label>
            <asp:CheckBox ID="deathb" runat="server"/>            
            <label style="margin-left: 10px">After Date:</label>
            <asp:CheckBox ID="deatha" runat="server"/>
        </div>
        <div style="margin: 10px"> 
            <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Submit"/>
        </div>
        <div style="margin: 10px></divstyle="margin:>
            <p>Update Deceased Date Form. This will update the deceased date for an animal</p>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="updateid" runat="server"/>
            <label style="margin-left: 10px">Animal ID</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="updatedeath" placeholder="yyyy-mm-dd" runat="server"/>
            <label style="margin-left: 10px" >Deceased Date:</label>
        </div>
        <div style="margin: 10px">
            <asp:Button runat="server" Text="Update" OnClick="Update_Click"/>
            <asp:Literal ID="updateMessage" runat ="server" />
        </div>
        <div>
            <asp:Literal ID="reportTable" runat ="server" />
        </div>
    </form>
</body>
</html>
