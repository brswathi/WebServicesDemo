<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="StudentWebSErviceDEMO.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" lang="javascript">
        function GetStudentById()
        {
            var id = document.getElementById("txtId").value;
            StudentWebSErviceDEMO.StudentService.GetStudentByID(id, GetStudentByIdSuccessCallBack, GetStudentByIdFailCallBack);
         
        }
        function GetStudentByIdSuccessCallBack(results)
        {
            document.getElementById("txtName").value = results["Name"];
            document.getElementById("txtGender").value = results["Gender"];
            document.getElementById("txtCity").value = results["City"];
        }
        function GetStudentByIdFailCallBack(errors)
        {
            alert(errors.get_message());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/StudentService.asmx" />
            </Services>
        </asp:ScriptManager>
<table>
    <tr>
        <td>
            <b>StudentID</b>
        </td>
        <td>
            <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
            <input id="Button1" type="button" value="Get Student" onclick="GetStudentById()"/>
        </td>
    </tr>
    <tr>
        <td>
            <b>student Name</b>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td><b> Gender</b></td>
        <td>
            <asp:TextBox ID="txtGender" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>
            <b>City</b>
        </td>
        <td>
            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox></td>
    </tr>
</table>
    </form>
</body>
</html>
