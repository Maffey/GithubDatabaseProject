<%@ Page Title="Create Github Repository" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateRepository.aspx.cs" Inherits="github_CreateRepository" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            height: 25px;
            width: 191px;
        }
        .style4
        {
            width: 191px;
        }
        .style6
        {
            width: 191px;
            height: 29px;
        }
        .style9
        {
            width: 191px;
            height: 48px;
        }
        .style11
        {
            height: 48px;
            width: 70px;
        }
        .style12
        {
            height: 25px;
            width: 70px;
        }
        .style13
        {
            height: 29px;
            width: 70px;
        }
        .style14
        {
            width: 70px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td class="style13">
                Nazwa repozytorium:</td>
            <td class="style6">
                <asp:TextBox ID="NameText" runat="server" Width="434px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="NameText" ErrorMessage="Nazwa jest wymagana!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style14">
                Właściciel:</td>
            <td class="style4">
                <asp:DropDownList ID="OwnerDrop" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="owner_name" 
                    DataValueField="id_owner">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style11">
                Data utworzenia:</td>
            <td class="style9">
                <asp:TextBox ID="DateCreatedText" runat="server" 
                    ontextchanged="TextBox1_TextChanged" Width="169px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="DateCreatedText" 
                    ErrorMessage="Data utworzenia jest wymagana!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style12">
                Rozmiar:</td>
            <td class="style3">
                <asp:TextBox ID="SizeText" runat="server" Width="169px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="SizeText" ErrorMessage="Rozmiar jest wymagany!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style14">
                Obserwujący:</td>
            <td class="style4">
                <asp:TextBox ID="WatchedText" runat="server" Width="169px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="WatchedText" ErrorMessage="Obserwujący są wymagani!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style14">
                Gwiazdki:</td>
            <td class="style4">
                <asp:TextBox ID="StarsText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="StarsText" ErrorMessage="Gwiazdki są wymagane!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                Commits:</td>
            <td class="style6">
                <asp:TextBox ID="CommitsText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="CommitsText" ErrorMessage="Commits są wymagane!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style14">
                Forks:</td>
            <td class="style4">
                <asp:TextBox ID="ForksText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="ForksText" ErrorMessage="Forks są wymagane!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style14">
                Gałęzie:</td>
            <td class="style4">
                <asp:TextBox ID="BranchesText" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="BranchesText" ErrorMessage="Gałęzie są wymagane!">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style14">
                Jest prywatne?</td>
            <td class="style4">
                <asp:CheckBox ID="IsPrivate" runat="server" 
                    oncheckedchanged="IsPrivate_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style13">
                Licencja:</td>
            <td class="style6">
                <asp:DropDownList ID="LicenseDrop" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSourceLicense" DataTextField="license_name" 
                    DataValueField="id_license">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style14">
                Środowisko pracy:</td>
            <td class="style4">
                <asp:DropDownList ID="EnvDrop" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSourceEnv" DataTextField="work_enviroment_name" 
                    DataValueField="id_work_enviroment">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style14">
                Data archiwizacji:</td>
            <td class="style4">
                <asp:TextBox ID="DateArchivedText" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style14">
                Link git:</td>
            <td class="style4">
                <asp:DropDownList ID="GitLinkDrop" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSourceGit" DataTextField="git_link" 
                    DataValueField="id_git_link">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Github %>" 
        SelectCommand="SELECT [id_owner], [owner_name] FROM [owner] ORDER BY [owner_name]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceLicense" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Github %>" 
        SelectCommand="SELECT * FROM [license] ORDER BY [license_name]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEnv" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Github %>" 
        SelectCommand="SELECT [id_work_enviroment], [work_enviroment_name] FROM [work_enviroment] ORDER BY [work_enviroment_name]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceGit" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Github %>" 
        SelectCommand="SELECT [id_git_link], [git_link] FROM [git_link] ORDER BY [git_link]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceInsert" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Github %>" 
        DeleteCommand="DELETE FROM [repository] WHERE [id_repo] = @id_repo" 
        InsertCommand="INSERT INTO [repository] ([id_owner], [id_git_link], [id_license], [id_work_enviroment], [repo_name], [date_created], [date_archived], [repo_size], [watched], [stars], [commits], [forks], [branches], [is_private]) VALUES (@id_owner, @id_git_link, @id_license, @id_work_enviroment, @repo_name, @date_created, @date_archived, @repo_size, @watched, @stars, @commits, @forks, @branches, @is_private)" 
        SelectCommand="SELECT * FROM [repository]" 
        UpdateCommand="UPDATE [repository] SET [id_owner] = @id_owner, [id_git_link] = @id_git_link, [id_license] = @id_license, [id_work_enviroment] = @id_work_enviroment, [repo_name] = @repo_name, [date_created] = @date_created, [date_archived] = @date_archived, [repo_size] = @repo_size, [watched] = @watched, [stars] = @stars, [commits] = @commits, [forks] = @forks, [branches] = @branches, [is_private] = @is_private WHERE [id_repo] = @id_repo">
        <DeleteParameters>
            <asp:Parameter Name="id_repo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="OwnerDrop" Name="id_owner" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="GitLinkDrop" Name="id_git_link" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="LicenseDrop" Name="id_license" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="EnvDrop" Name="id_work_enviroment" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="NameText" Name="repo_name" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="DateCreatedText" Name="date_created" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="DateArchivedText" Name="date_archived" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="SizeText" Name="repo_size" PropertyName="Text" 
                Type="Int64" />
            <asp:ControlParameter ControlID="WatchedText" Name="watched" 
                PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="StarsText" Name="stars" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="CommitsText" Name="commits" 
                PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="ForksText" Name="forks" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="BranchesText" Name="branches" 
                PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="IsPrivate" Name="is_private" 
                PropertyName="Checked" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_owner" Type="Int32" />
            <asp:Parameter Name="id_git_link" Type="Int32" />
            <asp:Parameter Name="id_license" Type="Int32" />
            <asp:Parameter Name="id_work_enviroment" Type="Int32" />
            <asp:Parameter Name="repo_name" Type="String" />
            <asp:Parameter Name="date_created" Type="DateTime" />
            <asp:Parameter Name="date_archived" Type="DateTime" />
            <asp:Parameter Name="repo_size" Type="Int64" />
            <asp:Parameter Name="watched" Type="Int32" />
            <asp:Parameter Name="stars" Type="Int32" />
            <asp:Parameter Name="commits" Type="Int32" />
            <asp:Parameter Name="forks" Type="Int32" />
            <asp:Parameter Name="branches" Type="Int32" />
            <asp:Parameter Name="is_private" Type="Boolean" />
            <asp:Parameter Name="id_repo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Stwórz" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</asp:Content>

