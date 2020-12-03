<!DOCTYPE html>

<%@page import="book_table.Staff_Book_Table_Model"%>
<%@page import="common_use_bean.Book_Use_Bean"%>
<%@page import="copy_table_model.Copy_Table_Model"%><html class="no-js">

<head>

    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/offline/theme.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.autocomplete.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap-datepicker/datepicker.css">
    <script src="<%=request.getContextPath()%>/vendor/modernizr.js"></script>

</head>

<body>

    <div class="app" data-sidebar="locked">
         <%@include file="../../common/tab.jsp" %>

			<%
			String book_sl_no=(String)request.getParameter("s");
			Staff_Book_Table_Model obj_Staff_Book_Table_Model=new Staff_Book_Table_Model();
			Book_Use_Bean obj_Book_Use_Bean=new Book_Use_Bean();
			obj_Book_Use_Bean=obj_Staff_Book_Table_Model.get_Complete_details_of_book(book_sl_no);
			%>
            <section class="main-content">
                <div class="content-wrap">

                    <div class="row mg-b">
                        <div class="col-xs-6"> 
                            <h3 class="no-margin"> <%=obj_Book_Use_Bean.getBook_title() %></h3>  
                        </div>
                       <a href="<%=Common_Things.url %>/copy-books/?kou=<%=obj_Book_Use_Bean.getBook_id_no() %>" class="btn btn-info">Copy</a>
                    </div>
 
                    <div class="col-lg-6">

                    <%
							String message=(String)session.getAttribute("add_book_message");
							if(message!=null){
							%>
								
								 <div class="alert alert-success">
                                        <%=message%>
                                    </div>


							<%			session.removeAttribute("add_book_message");
							}
							%>

                                            <section class="panel">
                                               
                                                <div class="panel-body">

                                                    <form action="<%=Common_Things.url%>/staff-add-book-controller" class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Book Title </label>
                                                            	<div class="col-sm-10">
                                                               	<input type="text" class="form-control" name="book_title" data-parsley-required="true" data-parsley-trigger="change" placeholder="Book Title" value="<% if(obj_Book_Use_Bean.getBook_title()!=null){out.println(obj_Book_Use_Bean.getBook_title());} %>" readonly="readonly">
                                                               </div> 
                                                             
                                                        </div> 
                                                        
                                                       
                                                        	<hr>
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Category</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" id="category_name"  placeholder="Category" name="category_name" value="<% if(obj_Book_Use_Bean.getCategory_name()!=null){out.println(obj_Book_Use_Bean.getCategory_name());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                       		<hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Author</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Author" name="author_name" value="<% if(obj_Book_Use_Bean.getAuthor_name()!=null){out.println(obj_Book_Use_Bean.getAuthor_name());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                          	<hr> 
                                                         <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">Publisher</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="Publisher" name="publisher_name" value="<% if(obj_Book_Use_Bean.getPublisher_name()!=null){out.println(obj_Book_Use_Bean.getPublisher_name());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                        <hr> 
                                                        
                                                        <div class="form-group">
                                                            <label for="inputEmail3" class="col-sm-2 control-label">ISBN</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" placeholder="ISBN" name="isbn" value="<% if(obj_Book_Use_Bean.getIsbn()!=null){out.println(obj_Book_Use_Bean.getIsbn());} %>" readonly="readonly">
                                                            </div>
                                                        </div>
                                                         <hr> 
                                                        
                                                        </div>
                                                        <div class="form-group">  
                                                            <div class="col-sm-offset-2 col-sm-15">
                                                                <a href="<%=Common_Things.url %>/edit-book/?s=<%=obj_Book_Use_Bean.getBook_id_no() %>" class="btn btn-success">Edit Details</a> 

                                                            </div>
                                                        </div>
                                                    </form>

                                                </div> 
                                                
                                         		 <div class="col-lg-6">
                                            <section class="panel panel-primary">
                                <div class="panel-heading">Library Availability 
                                    
                                </div>
                                <ul class="list-group">
                                
                                 <table class="table table-hover no-margin">
                                        <thead>
                                             <tr>
                                                <th>#</th>
                                                <th>Book Bar Code </th>
                                                <th>Status</th>
                                                <th>Borrow</th>
                                                <th>Details</th>
                                                <th>Shelf</th>
                                               
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                
                                
                                	<%
                                	Copy_Table_Model obj_Copy_Table_Model=new Copy_Table_Model();                                                                                                                               		//Staff_Book_Table_Model obj_Staff_Book_Table_Model=new Staff_Book_Table_Model(); 
                             	List<Book_Use_Bean> list_books=obj_Copy_Table_Model.get_books_status(book_sl_no);
                             	
                             	
                             	if(list_books!=null){
                             		Iterator<Book_Use_Bean> it_list_books=list_books.iterator();
                             		int temp_count=1;
                             		while(it_list_books.hasNext()){
                             			obj_Book_Use_Bean=it_list_books.next();
                                                                                                                                                                	%>
                                	
                                	 		 <tr>
                                                <td><%=temp_count++ %></td>
                                                <td><%=obj_Book_Use_Bean.getBar_code() %></td>
                                               
                                                <td>
                                                	<%
                                                	
                                                	if(obj_Book_Use_Bean.getBook_status()!=null){
                                                		if(obj_Book_Use_Bean.getBook_status().contains("Not")){
                                                	%>
                                                		<button type="button" class="btn btn-danger btn-xs">Not Available</button>
                                                	<%	
                                                		}else{
                                                	%>
                                                    		<button type="button" class="btn btn-success btn-xs">Available</button>
                                                    <%	
                                                    			
                                                			
                                                		}
                                                	}
                                                	%>
                                                </td>
                                               
                                                <td>
                                                
                                                <%
                                                	
                                                	if(obj_Book_Use_Bean.getBook_status()!=null){
                                                		if(obj_Book_Use_Bean.getBook_status().contains("Not")){
                                                	%>
                                                		
                                                		
                                                	<%	
                                                		}else{
                                                	%>
                                                    		
                                                    		<a href="<%=Common_Things.url %>/borrow-book/?jin=<%=obj_Book_Use_Bean.getId_no() %>" class="btn btn-success btn-xs">BORROW</a>
                                                
                                                    <%	
                                                    			
                                                			
                                                		}
                                                	}
                                                	%>
                                                
                                                
                                              
                                                </td>
                                                <td>
                                                <a href="<%=Common_Things.url %>/borrow-history/?jin=<%=obj_Book_Use_Bean.getBook_title() %>&bn=<%=obj_Book_Use_Bean.getBar_code() %>" class="btn btn-danger btn-xs">View Details</a>
                                                
                                                </td>
                                                <td>
                                                	<%
                                                	if(obj_Book_Use_Bean.getShelf()!=null  && !obj_Book_Use_Bean.getShelf().contains("null")){
                                                		out.println(obj_Book_Use_Bean.getShelf());
                                                	}
                                                	%>
                                                
                                                </td>
                                                
                                             
                                            
                                               
                                                
                                            </tr>
                                   
                                	<%		 
                                			
                                			
                                		}
                                		
                                		
                                	}else{ 
                                		%>
                                		 	<tr> 
                                                <td colspan="4">No Books In Library</td>
                                                
                                            </tr>
                                		
                                		<%
                                	}
                                	
                                	%>
                                
				                                   </tbody>
				                                    </table>
                                  
                                </ul>

                            </section> 
                                        </div>

                </div>
            </section>
        </section>

    </div>
  	<script src="<%=Common_Things.url %>/vendor/bootstrap-select/bootstrap-select.js"></script>
    <script src="<%=Common_Things.url %>/vendor/datatables/jquery.dataTables.js"></script>
    <script src="<%=Common_Things.url %>/vendor/slider/bootstrap-slider.js"></script>
    <script src="<%=Common_Things.url %>/js/off-canvas.js"></script>
    <script src="<%=Common_Things.url %>/vendor/offline/offline.min.js"></script>
    <script src="<%=Common_Things.url %>/vendor/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="<%=Common_Things.url %>/js/main.js"></script>
	<script src="<%=Common_Things.url %>/js/datatables.js"></script>
	<script src="<%=Common_Things.url %>/vendor/switchery/switchery.js"></script>
    <script src="<%=Common_Things.url %>/js/forms.js"></script>

</body>

</html>