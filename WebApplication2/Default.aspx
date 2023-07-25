<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="row">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
                <ContentTemplate>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="30"></asp:Label>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
            </asp:Timer>
        </div>

        <div class="row">
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </div>

        <div class="row">
            <asp:Button ID="Button1" runat="server" Text="入力イベントが起きた" />
        </div>
        <div class="row">
            <asp:Button ID="Button2" runat="server" Text="PageMethods呼び出し" OnClientClick="getData(); return false;" />
        </div>
        <div class="row">
            <div class="span6">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
        </div>
    </main>
    <script type="text/javascript">
        function getData() {
            PageMethods.GetData(onSuccess, onError);
        }

        function onSuccess(result, userContext, methodName) {
            $('#TextBox1').val(result);
        }
        function onError(result, currentContext, methodName) {
            alert('error:' + result.get_message());
        }
    </script>
</asp:Content>
