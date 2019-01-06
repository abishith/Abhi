<%@ page import = "java.sql.*" %>
<%
try
{
	Connection connection = null;
	Statement statement = null;
	Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://192.241.244.177/db_Abhi_DMart","root", "tecnics");
	String query = "select * from Items_view1 limit "+request.getParameter("first")+","+request.getParameter("last")+";";
	statement = connection.createStatement();
	ResultSet rs = statement.executeQuery(query);
	ResultSetMetaData resultSetMetaData = rs.getMetaData();
	if(request.getParameter("first").equals("0"))
	{
		out.print("<tr>");
		for(int Counter = 1; Counter <= resultSetMetaData.getColumnCount(); Counter++)
		{
			out.print("<th>"+resultSetMetaData.getColumnName(Counter)+"</th>");
		}
		out.print("</tr>");
	}
	int Counter1 = 0;
	while(rs.next())
	{
		out.print("<tr id=" + rs.getString(1) + ">");
		for(int Counter = 1; Counter <= resultSetMetaData.getColumnCount(); Counter++)
		{
			out.print("<td>"+rs.getString(Counter)+"</td>");
		}
		out.print("</tr>");
		Counter1++;
	}
	connection.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}	
%>