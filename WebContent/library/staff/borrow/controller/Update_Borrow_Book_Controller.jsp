<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@page import="common.Common_Things"%>
<%@page import="borrow_table_model.Borrow_Table_Model"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<jsp:useBean id="obj_Borrow_Use_Bean" class="common_use_bean.Borrow_Use_Bean"></jsp:useBean>
	<jsp:setProperty property="*" name="obj_Borrow_Use_Bean"/>
	
	<%
			
	
	  
	  
	   
	Borrow_Table_Model obj_Borrow_Table_Model=new Borrow_Table_Model();
	     
	   int flag=obj_Borrow_Table_Model.update_borrow(obj_Borrow_Use_Bean);
	   
	   if(flag==1){
		   
			
			session.setAttribute("borrow_book_message","Borrow Updated Successfully");
		
	   }else if(flag==18){		
		   
		   session.setAttribute("borrow_book_message","Member with "+obj_Borrow_Use_Bean.getMember_id()+" not available");
		   
	   }else{

			 session.setAttribute("borrow_book_message","Update Failed");
		 
	   } 
	   
	    
	   
		%>
		
		
		  
		  
		  		 <script type="text/javascript">
						window.location.href="<%=Common_Things.url%>/update-borrow-book/?lololo=<%=obj_Borrow_Use_Bean.getBorrow_id_no()%>";
				</script>
	
	
	  
</body>
</html>