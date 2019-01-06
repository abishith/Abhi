<%@ page import = "java.sql.*" %>
<%
try
{
	Connection conn = null;
	PreparedStatement preparedStatement = null;
	Statement statement = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://192.241.244.177/db_Abhi_DMart","root", "tecnics");
	String insertFunction = "select adding_stock_into_items('"+request.getParameter("item_id")+"','"+request.getParameter("description")+"','"+request.getParameter("unit_price")+"','"+request.getParameter("stock_qty")+"','"+request.getParameter("supplier_id")+"');";
	statement = conn.createStatement();
	ResultSet result = statement.executeQuery(insertFunction);
	out.print(result.next());
	conn.close();
}
catch(Exception e)
{
	out.println(e.getMessage());
}	
%>