<%@ Page Title="Zarządzaj wiad., usprawniona wersja" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="zarzadzaj_wiadomosciami1.aspx.cs" Inherits="administracja_zarzadzaj_wiadomosciami1" %>

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
        DeleteCommand="DELETE FROM [dzial] WHERE [Id_dzial] = @Id_dzial" 
        InsertCommand="INSERT INTO [dzial] ([Nazwa_dzial]) VALUES (@Nazwa_dzial)" 
        onselecting="SqlDataSource2_Selecting" 
        SelectCommand="SELECT * FROM [dzial] ORDER BY [Nazwa_dzial]" 
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
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_wiadomosc" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id_wiadomosc" HeaderText="Id_wiadomosc" 
                InsertVisible="False" ReadOnly="True" SortExpression="Id_wiadomosc" 
                Visible="False" />
            <asp:BoundField DataField="Nazwa_dzial" HeaderText="Nazwa_dzial" 
                SortExpression="Nazwa_dzial" Visible="False" />
            <asp:TemplateField HeaderText="Nazwa działu">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="Nazwa_dzial" 
                        DataValueField="Id_dzial" SelectedValue='<%# Bind("Id_dzial") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("Nazwa_dzial") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
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

