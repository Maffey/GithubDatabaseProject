<%@ Page Title="przeglądaj działami" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="przegladaj_dzialami.aspx.cs" Inherits="administracja_przegladaj_dzialami" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:polaczenie_wiadomosc %>" 
        onselecting="SqlDataSource1_Selecting" 
        SelectCommand="SELECT * FROM [dzial] ORDER BY [Nazwa_dzial]">
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource1" DataTextField="Nazwa_dzial" 
        DataValueField="Id_dzial">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:polaczenie_wiadomosc %>" 
        SelectCommand="SELECT [Id_dzial], [Imie], [Nazwisko], [Email], [Telefon], [Tresc] FROM [wiadomosc] WHERE ([Id_dzial] = @Id_dzial)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Id_dzial" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource2" EmptyDataText="No data found." 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id_dzial" HeaderText="Id_dzial" 
                SortExpression="Id_dzial" Visible="False" />
            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" 
                SortExpression="Nazwisko" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Telefon" HeaderText="Telefon" 
                SortExpression="Telefon" />
            <asp:BoundField DataField="Tresc" HeaderText="Tresc" SortExpression="Tresc" />
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

