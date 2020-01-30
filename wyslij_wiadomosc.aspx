<%@ Page Title="wyślij wiadomość" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="wyslij_wiadomosc.aspx.cs" Inherits="formularz2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 104px;
        }
        .style2
        {
            width: 992px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:polaczenie_wiadomosc %>" 
        SelectCommand="SELECT * FROM [dzial] ORDER BY [Nazwa_dzial]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:polaczenie_wiadomosc %>" 
        DeleteCommand="DELETE FROM [wiadomosc] WHERE [Id_wiadomosc] = @Id_wiadomosc" 
        InsertCommand="INSERT INTO [wiadomosc] ([Id_dzial], [Imie], [Nazwisko], [Email], [Telefon], [Tresc]) VALUES (@Id_dzial, @Imie, @Nazwisko, @Email, @Telefon, @Tresc)" 
        SelectCommand="SELECT * FROM [wiadomosc]" 
        UpdateCommand="UPDATE [wiadomosc] SET [Id_dzial] = @Id_dzial, [Imie] = @Imie, [Nazwisko] = @Nazwisko, [Email] = @Email, [Telefon] = @Telefon, [Tresc] = @Tresc WHERE [Id_wiadomosc] = @Id_wiadomosc">
        <DeleteParameters>
            <asp:Parameter Name="Id_wiadomosc" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="ddl_dzial" Name="Id_dzial" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="tb_imie" Name="Imie" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="tb_nazwisko" Name="Nazwisko" 
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tb_email" Name="Email" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="tb_telefon" Name="Telefon" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="tb_wiadomosc" Name="Tresc" PropertyName="Text" 
                Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id_dzial" Type="Int32" />
            <asp:Parameter Name="Imie" Type="String" />
            <asp:Parameter Name="Nazwisko" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Telefon" Type="String" />
            <asp:Parameter Name="Tresc" Type="String" />
            <asp:Parameter Name="Id_wiadomosc" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <table style="width: 36%;">
        <tr>
            <td class="style1">
                Dział:</td>
            <td class="style2">
                <asp:DropDownList ID="ddl_dzial" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="Nazwa_dzial" 
                    DataValueField="Id_dzial">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Imię:</td>
            <td class="style2">
                <asp:TextBox ID="tb_imie" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="tb_imie" ErrorMessage="nie podano imienia!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Nazwisko:</td>
            <td class="style2">
                <asp:TextBox ID="tb_nazwisko" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="tb_nazwisko" ErrorMessage="nie podano nazwiska!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Email:</td>
            <td class="style2">
                <asp:TextBox ID="tb_email" runat="server" ontextchanged="TextBox3_TextChanged"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="tb_email" ErrorMessage="Podany email jest niepoprawny!" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="tb_email" ErrorMessage="nie podano maila!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Nr telefonu:</td>
            <td class="style2">
                <asp:TextBox ID="tb_telefon" runat="server" 
                    ontextchanged="TextBox4_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="tb_telefon" ErrorMessage="nie podano telefonu!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Wiadomość:</td>
            <td class="style2">
                <asp:TextBox ID="tb_wiadomosc" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="tb_wiadomosc" ErrorMessage="nie podano wiadomosci!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="wyślij wiadomość" />
</asp:Content>

