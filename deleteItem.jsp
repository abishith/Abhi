<%@ page import = "java.sql.*" %>
<%
try
{
	Connection conn = null;
	Statement stmt = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("URL","root", "password");
	String query = "delete from Items where item_id = \'"+request.getParameter("item_id")+"\';";
	stmt = conn.createStatement();
	int result = stmt.executeUpdate(query);
	conn.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}	
%>
