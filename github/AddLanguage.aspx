<%@ Page Title="Add Language" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddLanguage.aspx.cs" Inherits="github_AddLanguage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Instytut:<asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource1" DataTextField="lang_institution_name" 
            DataValueField="id_lang_institution">
        </asp:DropDownList>
    </p>
    <p>
        Nazwa języka:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p>
        Wersja:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Github %>" 
            SelectCommand="SELECT * FROM [lang_institution] ORDER BY [lang_institution_name]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Github %>" 
            DeleteCommand="DELETE FROM [language] WHERE [id_language] = @id_language" 
            InsertCommand="INSERT INTO [language] ([id_lang_institution], [language_name], [language_version]) VALUES (@id_lang_institution, @language_name, @language_version)" 
            SelectCommand="SELECT * FROM [language]" 
            UpdateCommand="UPDATE [language] SET [id_lang_institution] = @id_lang_institution, [language_name] = @language_name, [language_version] = @language_version WHERE [id_language] = @id_language">
            <DeleteParameters>
                <asp:Parameter Name="id_language" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id_lang_institution" 
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" Name="language_name" 
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="language_version" 
                    PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_lang_institution" Type="Int32" />
                <asp:Parameter Name="language_name" Type="String" />
                <asp:Parameter Name="language_version" Type="String" />
                <asp:Parameter Name="id_language" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Prześlij" />
    </p>
</asp:Content>

