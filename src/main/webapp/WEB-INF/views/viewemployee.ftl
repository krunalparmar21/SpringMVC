<!DOCTYPE html>
<html>

<head>
  <title>Insert title here</title>
		<link rel="stylesheet" href="./resources/library/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="./resources/css/custom.css">
		<script src="./resources/js/jquery-3.6.0.min.js"></script>
	
<body>
  <div class="container-fluid">
    <table class="datatable table table-hover table-bordered">
      <thead>
        <tr>
			<th>User Id</th>
			<th>First Name</th>
			<th>Email</th>
			<th>Gender</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
      </thead>
      <#list UserDataList![] as userObject>
      <tbody>
         <tr>       
			<td>${userObject.id!""}</td>
			<td>${userObject.firstname!""}</td>
			<td>${userObject.email!""}</td>
			<td>${userObject.gender!""}</td>
			<td><a href="EditProfile?email=${userObject.email!""}"  class="btn btn-success">Edit</a></td>
			<td><a id='${userObject.id!""}' class="btn btn-danger  delete-user">Delete</a></td>
		</tr>	
      </tbody>
      </#list>
    </table>
  </div>
  	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
	
  	<script>
		$(document).ready(function() {
			$(".delete-user").click(function() {
				var temp = confirm(" Are you sure want to delete ?");
				if (temp) {
					var id = $(this).attr('id');
					console.log(id);
					$.ajax({
						url : "DeleteEmployee",
						type : "post",
						data : {
							id : id,
						},
						success : function(data) {
						}
					});	
					$(this).parents("tr").animate("fast").animate({
						opacity : "hide"
					}, "fast");
				}
				
			});
		});
	</script>
			  
</body>

</html>