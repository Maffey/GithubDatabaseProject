<%@ Page Title="Zarządzanie działami, usprawniona wersja" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="zarzadzaj_dzialami1.aspx.cs" Inherits="administracja_zarzadzaj_dzialami1" %>

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
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="Id_dzial" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id_dzial" HeaderText="Id_dzial" 
                InsertVisible="False" ReadOnly="True" SortExpression="Id_dzial" 
                Visible="False" />
            <asp:BoundField DataField="Nazwa_dzial" HeaderText="Nazwa_dzial" 
                SortExpression="Nazwa_dzial" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
</asp:Content>

