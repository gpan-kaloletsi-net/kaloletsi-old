<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create a New Account</h2>
    <p>
        Use the form below to create a new account. Registration is needed only to manage the content of the site. Otherwise the site is free.
        Passwords are required to be a minimum of <%=Html.Encode(ViewData["PasswordLength"])%> characters in length.
    </p>
    <%= Html.ValidationSummary("Account creation was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) { %>
        <div>
            <fieldset>
              
                <p>
                    <label for="username">Username:</label><br />
                    <%= Html.TextBox("username") %>
                    <%= Html.ValidationMessage("username") %>
                </p>
                <p>
                    <label for="email">Email:</label><br />
                    <%= Html.TextBox("email") %>
                    <%= Html.ValidationMessage("email") %>
                </p>
                <p>
                    <label for="password">Password:</label><br />
                    <%= Html.Password("password") %>
                    <%= Html.ValidationMessage("password") %>
                </p>
                <p>
                    <label for="confirmPassword">Confirm password:</label><br />
                    <%= Html.Password("confirmPassword") %>
                    <%= Html.ValidationMessage("confirmPassword") %>
                </p>
                <p>
                    <input type="submit" value="Register" />
                </p>
                
            </fieldset>
        </div>
    <% } %>
    <p></p>
</asp:Content>
