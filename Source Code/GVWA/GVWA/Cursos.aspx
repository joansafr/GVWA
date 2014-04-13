<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cursos.aspx.cs" Inherits="GVWA.Cursos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/bootstrap.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.css" rel="stylesheet" />
    <style>
        body {
            margin-top: 2%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <form runat="server">
                    <div class="input-group">
                        <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->

                        <asp:TextBox ID="CursoTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:Button ID="BuscarButton" CssClass="btn btn-default" runat="server" Text="Buscar" OnClick="BuscarButton_Click"></asp:Button>
                        </span>
                    </div>
                </form>
            </div>
            <div class="col-md-9">
                <table class="table table-list-search">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Curso</th>
                            <th>Profesor</th>
                            <th>Resumen</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% foreach (var curso in this.ListaCursos)
                           {%>
                        <tr>
                            <td><%=curso.Id %></td>
                            <td><%=curso.Descripcion %></td>
                            <td><%=curso.Profesor %></td>
                            <td><%=curso.Resumen %></td>
                        </tr>
                        <%  } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
