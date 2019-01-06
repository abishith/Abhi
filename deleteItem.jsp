<%@ page import = "java.sql.*" %>
<%
try
{
	Connection conn = null;
	Statement stmt = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://192.241.244.177/db_Abhi_DMart","root", "tecnics");
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
<script type="text/javascript">
var data = JSON.parse(call.responseText);
            if(data[0] === 'none') { $('#purchaseHistory').html('<center><b>There is no purchase history to show.</b></center>'); return; }
            var purchases = data.length;
            $('#purchaseHistory').empty();
            for(i = 0; i < purchases; i++) {
                $('#purchaseHistory').append('<tr ondblclick="popup(\'order.php?order='+data[i]['ORDER']+'&cust='+CUSTOMER_ID+'\', \'Order #'+ data[i]['ORDER'] +'\', \'1150\', \'845\');"><td style="width: 60px;">'+ data[i]['ORDERNO'] +'</td><td style="width: 100px;">'+data[i]['ORDER_DATE'] +'</td><td style="width: 100px;">'+data[i]['PRODCODE']+'</td><td style="width: 170px;">'+ data[i]['ITEM'] +'</td><td style="width: 25px;">'+ data[i]['QUANTITY'] +'</td><td style="width: 120px;">'+ data[i]['STATUS'] +'</td><td style="width: 75px;">'+ data[i]['SHIP_DATE'] +'</td><td style="width: 60px;">---</td><td style="width: 70px;">'+ data[i]['AMOUNT'] +'</td><td style="width:85px;">---</td></tr>');
            }
            </script>