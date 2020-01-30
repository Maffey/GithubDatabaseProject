<%@ Page Title="Add Language Institution" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddLangInst.aspx.cs" Inherits="github_AddLangInst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    Nazwa instytucji odpowiedzialnej za język programowania:</p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Github %>" 
        DeleteCommand="DELETE FROM [lang_institution] WHERE [id_lang_institution] = @id_lang_institution" 
        InsertCommand="INSERT INTO [lang_institution] ([lang_institution_name]) VALUES (@lang_institution_name)" 
        SelectCommand="SELECT * FROM [lang_institution]" 
        
        UpdateCommand="UPDATE [lang_institution] SET [lang_institution_name] = @lang_institution_name WHERE [id_lang_institution] = @id_lang_institution" 
        onselecting="SqlDataSource1_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="id_lang_institution" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="lang_institution_name" 
                PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="lang_institution_name" Type="String" />
            <asp:Parameter Name="id_lang_institution" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
<p>
    <asp:TextBox ID="TextBox1" runat="server" Height="27px" Width="462px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="Nie podano nazwy instytutu!">*</asp:RequiredFieldValidator>
</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
<p>
    <asp:Button ID="Button1" runat="server" Text="Dodaj instytucję" 
        onclick="Button1_Click1" style="height: 29px" />
</p>
</asp:Content>

