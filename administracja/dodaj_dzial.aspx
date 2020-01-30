<%@ Page Title="dodaj dział" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dodaj_dzial.aspx.cs" Inherits="administracja_dodaj_dzial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:polaczenie_wiadomosc %>" 
        DeleteCommand="DELETE FROM [dzial] WHERE [Id_dzial] = @Id_dzial" 
        InsertCommand="INSERT INTO [dzial] ([Nazwa_dzial]) VALUES (@Nazwa_dzial)" 
        SelectCommand="SELECT * FROM [dzial]" 
        UpdateCommand="UPDATE [dzial] SET [Nazwa_dzial] = @Nazwa_dzial WHERE [Id_dzial] = @Id_dzial">
        <DeleteParameters>
            <asp:Parameter Name="Id_dzial" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="Nazwa_dzial" 
                PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nazwa_dzial" Type="String" />
            <asp:Parameter Name="Id_dzial" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    nazwa działu
    <asp:TextBox ID="TextBox1" runat="server" style="height: 22px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ErrorMessage="nie podano działu!" 
        ForeColor="Maroon">*</asp:RequiredFieldValidator>
</p>
<p>
    <asp:Button ID="Button1" runat="server" Text="dodaj dział" 
        onclick="Button1_Click1" />
</p>
<p>
    </p>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" 
    ForeColor="Maroon" />
</asp:Content>

