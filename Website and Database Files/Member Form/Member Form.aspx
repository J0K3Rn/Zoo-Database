<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member Form.aspx.cs" Inherits="Member_Form.Member_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label style="margin-left: 50px">MEMBER FORM. This is to enter a new Member into the database.</label>
        </div>
        <p>
            <asp:TextBox ID="AddMEmail" runat="server"/>
            &nbsp;Member Email</p>
        <p>
            <asp:TextBox ID="AddMFname" runat="server"/>
            &nbsp;Member First Name</p>
        <p>
            <asp:TextBox ID="AddMMInit" runat="server"/>
            &nbsp;Member Middle Initial</p>
        <p>
            <asp:TextBox ID="AddMLName" runat="server"/>
            &nbsp;Member Last Name</p>
        <p>
            <asp:Button ID="CreateMember" runat="server" OnClick="SubmitMember_Click" Text="Submit" OnClientClick="SubmitMember_Click" />
        </p>
        <p>
            <label style="margin-left: 50px">MEMBER LIST. This is to get all Members from the database.</label>
        </p>
        <p>
            <asp:Button ID="GetMembers" runat="server" OnClick="GetMembers_Click" Text="Get All Members" />
        </p>
        <p>
            <asp:Literal ID="reportTable" runat ="server" />
        </p>
        <p>
            <label style="margin-left: 50px">MEMBER DELETION. This is to delete any Member from the database.</label> </p>
        <p>
            <asp:TextBox ID="Del_MEmail" runat="server"/>
            &nbsp;Member Email</p>
        <p>
            <asp:Button ID="DeleteMember" runat="server" Text="Banish" OnClick="DeleteMember_Click" />
        </p>
        <p>
            <label style="margin-left: 50px">MEMBER REPORT. This is to specify a list of Members from the database.</label>
        </p>
        <p>
            <asp:CheckBox ID="includestartdate" runat="server"/>
            <asp:TextBox ID="MemStartDate" runat="server"  placeholder="yyyy-mm-dd" />
            <label style="margin-left: 10px">Start Date (YEAR-MO-DA):</label>
            <label style="margin-left: 10px">Before Date:</label>
            <asp:CheckBox ID="beforedate" runat="server"/>
            <label style="margin-left: 10px">After Date:</label>
            <asp:CheckBox ID="afterdate" runat="server"/>
        </p>
        <p>
            <asp:Button ID="ReportMember" runat="server" OnClick="ReportMember_Click" Text="Submit"/>
        </p>
        <p>
            <asp:Literal ID="MEMreport" runat ="server" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
