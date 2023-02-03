<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeFormV2.aspx.cs" Inherits="EmployeeFormV2.EmployeeFormV2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label style="margin-left: 50px">NEW EMPLOYEE FORM</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="fname" runat="server"/>
            <label style="margin-left: 10px">First Name: </label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="minitial" runat="server" />
            <label style="margin-left: 10px">Middle Initial:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="lname" runat="server"/>
            <label style="margin-left: 10px">Last Name:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="id" runat="server"/>
            <label style="margin-left: 10px">ID:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="startdate" runat="server"  placeholder="yyyy-mm-dd"/>
            <label style="margin-left: 10px">Start Date:</label>
        </div>
        <div style="margin: 10px">            
            <asp:TextBox ID="address" runat="server" />
            <label style="margin-left: 10px">Address:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="phone" runat="server" placeholder="###-###-####"/>
            <label style="margin-left: 10px">Phone Number:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="sex" runat="server"  placeholder="'M' or 'F'" />
            <label style="margin-left: 10px">Sex:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="dob" runat="server"/>
            <label style="margin-left: 10px">dob:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="email" runat="server"/>
            <label style="margin-left: 10px">Email:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="username" runat="server"/>
            <label style="margin-left: 10px">Username:</label>
        </div>
        <div style="margin: 10px">
            <asp:TextBox ID="password" runat="server"/>
            <label style="margin-left: 10px">Password:</label>
        </div>
        <div>
             <asp:DropDownList ID="role" style="margin: 10px" runat="server">
                <asp:ListItem Text="Supervisor" Value="Supervisor"></asp:ListItem>
                <asp:ListItem Text="Employee" Value="Employee"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div style="margin: 10px"> 
            <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitButton_Click" Text="Submit"/>
        </div>
    </form>
</body>
</html>
