<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/library/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="./resources/css/custom.css">
	<script src="./resources/js/jquery-3.6.0.min.js"></script>
<style>
		html,body{
		    margin: 0%;
		    padding: 0%;
		    background-color: rgb(234, 228, 239);
		    
		}
		.form-section2 {
			margin:5%;
			height: auto;
			min-height: 510px;
		}
		
		#csv-btn {
			margin-top: 3%;
			margin-left: 43%;
		}
		
</style>
</head>
<body>
	<section class="form-section2">
		<table id="table_id" class="ui celled table" style="width: 100%">
			<thead>
				<tr>
					<th>Emp ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Gender</th>
					<th>Edit</th>
					<th>Delete</th>

				</tr>
			</thead>
			<#list AllUserList![] as perUser>
				<tbody>
					<tr>
						<td>${perUser.id!""}</td>
						<td>${perUser.name!""}</td>
						<td>${perUser.email!""}</td>
						<td>${perUser.gender!""}</td>
						<td><a href="EditProfile?email=${perUser.email!""}"  class="btn btn-success">Edit</a></td>
						<td><a id='${perUser.id!""}' class="btn btn-danger del-user">Delete</a></td>
					</tr>
				</tbody>
			</#list>
		</table>
	
	</section>

	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
	
</body>
</html>