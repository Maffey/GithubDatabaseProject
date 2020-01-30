<%@ Page Title="przeglądaj wiadomości" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="przegladaj_wiadomosci.aspx.cs" Inherits="administracja_przegladaj_wiadomosci" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:polaczenie_wiadomosc %>" 
        SelectCommand="SELECT dzial.Nazwa_dzial, wiadomosc.Imie, wiadomosc.Nazwisko, wiadomosc.Email, wiadomosc.Tresc, wiadomosc.Telefon FROM dzial INNER JOIN wiadomosc ON dzial.Id_dzial = wiadomosc.Id_dzial">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="SqlDataSource1" GridLines="None" 
        EmptyDataText="No data found." ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Nazwa_dzial" HeaderText="Nazwa działu" 
                SortExpression="Nazwa_dzial" />
            <asp:BoundField DataField="Imie" HeaderText="Imię" SortExpression="Imie" />
            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" 
                SortExpression="Nazwisko" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Tresc" HeaderText="Treść" SortExpression="Tresc" />
            <asp:BoundField DataField="Telefon" HeaderText="Telefon" 
                SortExpression="Telefon" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
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

