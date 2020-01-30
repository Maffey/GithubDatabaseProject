<%@ Page Title="Zarządzaj Działami" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="zarzadzaj_dzialami.aspx.cs" Inherits="administracja_zarzadzaj_dzialami" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
        <asp:Parameter Name="Nazwa_dzial" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Nazwa_dzial" Type="String" />
        <asp:Parameter Name="Id_dzial" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
    AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id_dzial" 
    DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
    Height="50px" Width="125px">
    <AlternatingRowStyle BackColor="White" />
    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
    <EditRowStyle BackColor="#7C6F57" />
    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="Id_dzial" HeaderText="Id_dzial" 
            InsertVisible="False" ReadOnly="True" SortExpression="Id_dzial" />
        <asp:BoundField DataField="Nazwa_dzial" HeaderText="Nazwa_dzial" 
            SortExpression="Nazwa_dzial" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
            ShowInsertButton="True" />
    </Fields>
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
</asp:DetailsView>
</asp:Content>

