<%@ Page Title="zarządzaj wiadomościami" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="zarzadzaj_wiadomosciami.aspx.cs" Inherits="administracja_zarzadzaj_wiadomosciami" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:polaczenie_wiadomosc %>" 
    DeleteCommand="DELETE FROM [wiadomosc] WHERE [Id_wiadomosc] = @Id_wiadomosc" 
    InsertCommand="INSERT INTO [wiadomosc] ([Id_dzial], [Imie], [Nazwisko], [Email], [Telefon], [Tresc]) VALUES (@Id_dzial, @Imie, @Nazwisko, @Email, @Telefon, @Tresc)" 
    SelectCommand="SELECT wiadomosc.Id_wiadomosc, wiadomosc.Id_dzial, wiadomosc.Imie, wiadomosc.Nazwisko, wiadomosc.Email, wiadomosc.Telefon, wiadomosc.Tresc, dzial.Nazwa_dzial FROM wiadomosc INNER JOIN dzial ON wiadomosc.Id_dzial = dzial.Id_dzial" 
    
        UpdateCommand="UPDATE [wiadomosc] SET [Id_dzial] = @Id_dzial, [Imie] = @Imie, [Nazwisko] = @Nazwisko, [Email] = @Email, [Telefon] = @Telefon, [Tresc] = @Tresc WHERE [Id_wiadomosc] = @Id_wiadomosc">
    <DeleteParameters>
        <asp:Parameter Name="Id_wiadomosc" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Id_dzial" Type="Int32" />
        <asp:Parameter Name="Imie" Type="String" />
        <asp:Parameter Name="Nazwisko" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Telefon" Type="String" />
        <asp:Parameter Name="Tresc" Type="String" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:polaczenie_wiadomosc %>" 
        onselecting="SqlDataSource2_Selecting" 
        SelectCommand="SELECT * FROM [dzial] ORDER BY [Nazwa_dzial]">
    </asp:SqlDataSource>
<asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
    AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id_wiadomosc" 
    DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
    Height="50px" Width="125px">
    <AlternatingRowStyle BackColor="White" />
    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
    <EditRowStyle BackColor="#7C6F57" />
    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="Id_wiadomosc" HeaderText="Id_wiadomosc" 
            InsertVisible="False" ReadOnly="True" SortExpression="Id_wiadomosc" 
            Visible="False" />
        <asp:BoundField DataField="Id_dzial" HeaderText="Id_dzial" 
            SortExpression="Id_dzial" Visible="False" />
        <asp:BoundField DataField="Nazwa_dzial" HeaderText="Nazwa_dzial" 
            SortExpression="Nazwa_dzial" Visible="False" />
        <asp:TemplateField HeaderText="Nazwa działu">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="Nazwa_dzial" 
                    DataValueField="Id_dzial" SelectedValue='<%# Bind("Id_dzial") %>'>
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("Nazwa_dzial") %>'></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
        <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" 
            SortExpression="Nazwisko" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Telefon" HeaderText="Telefon" 
            SortExpression="Telefon" />
        <asp:BoundField DataField="Tresc" HeaderText="Tresc" SortExpression="Tresc" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
            ShowInsertButton="True" />
    </Fields>
    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#E3EAEB" />
</asp:DetailsView>
</asp:Content>

