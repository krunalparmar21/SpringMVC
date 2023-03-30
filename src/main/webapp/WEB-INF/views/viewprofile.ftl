

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- External  css -->
<link rel="stylesheet" href="./resources/css/registration.css">

<link rel="stylesheet" href="./resources/css/registration_inline.css">

<link rel="stylesheet"
	href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap-datepicker.css">
<style>
#profile-img{
		height:20%;
		width:20%;
		border: 1px solid black;
		border-radius:50%;
	}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<body>
	<form class="signup-form"  >

		<!-- form body -->
		<div class="form-body">
					
						<!-- Profile picture and Age -->
			<div class="form-group">
				<div class="form-group left">
					<label for="choose-file" class="label-title">Profile Picture</label> 
		<img id="profile-img" alt="Profile Image" src="data:image/jpg;base64,${sessionUser.imageBase64!""}">
					
				</div>
			</div>
			
						
			<!-- Firstname and Lastname -->
			<div class="horizontal-group">
				<div class="form-group left">
					<label for="first_name" class="label-title">First name </label>
					<div class="fields-value">${sessionUser.firstname!""}</div>
				
				</div>
				<div class="form-group right">
					<label for="lastname" class="label-title">Last name</label> 
					<div class="fields-value">${sessionUser.lastname!""}</div>
			
			</div>

			<!-- Dob and Phone no -->
			<div class="horizontal-group">
				<div class="form-group left">
					<label for="Date" class="label-title"> DOB </label>
					<div class="fields-value">${sessionUser.dob!""}</div>
			
				</div>
				<div class="form-group right">
					<label for="phone no" class="label-title">Phone No</label> 
					
					<div class="fields-value">${sessionUser.mobileno!""}</div>
				</div>
			</div>


			<!-- Email -->
			<div class="form-group">
				<label for="email" class="label-title">Email*</label> 
					<div class="fields-value">${sessionUser.email!""}</div>
			</div>

			<!-- Passwrod and confirm password -->
			<div class="horizontal-group">
				<div class="form-group left">
					<label for="password" class="label-title">Password *</label> 
							<div class="fields-value">${sessionUser.password!""}</div>
			
				</div>
				<div class="form-group right">
					<label for="confirm-password" class="label-title">Confirm
						Password *</label> 
					<div class="fields-value">${sessionUser.passwordConfirm!""}</div>
			
				</div>
			</div>
			<!-- Gender and Hobbies -->

			<div class="horizontal-group">
				<div class="form-group left">
					<label class="label-title">Gender:</label>
		
					<div class="fields-value">${sessionUser.gender!""}</div>
			
				</div>
				<div class="form-group right">
					<label class="label-title">Hobbies</label>
					<div class="fields-value">${sessionUser.hobby!""}</div>
		
				</div>
			</div>
			

			<!-- Address Address[0][address_line2] -->
			<#list sessionUser.address![] as add>	
			<div id="main-container">		
				<div class="panel card container-item">
					<div class="panel-body">
						<div class="panel-body">
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label class="control-label" for="address_line_one_0">Address
											line 1</label> 
									<div class="fields-value">${add.address1!""}</div>
			
									</div>
								</div>
							</div>
								
							<div class="row">
								<div class="col-sm-6">
								<label class="control-label" for="country">City</label>
								<div class="fields-value">${add.city!""}</div>
				    
								</div>
								<div class="col-sm-6">
									<label class="control-label" for="country">State</label>
										<div class="fields-value">${add.state!""}</div>		
								</div>
			
							</div>

							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label class="control-label" for="city_0">Area</label> 
									<div class="fields-value">${add.area!""}</div>		
						
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<label class="control-label" for="city_0">Postal code</label>
									<div class="fields-value">${add.postalcode!""}</div>		
								
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</#list>
			<div><a href="EditProfile?email=${sessionUser.email!""}"  class="btn btn-success">Edit</a></div>
			<div> <li class="nav-item"><a class="nav-link" href="Logout">Back Button</a></li></div>
	</form>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-149371669-1"></script>
	
	
	<script
		src="./resources/js/jquery.min.js"></script>
	<script
		src="./resources/js/popper.min.js"></script>
	<script
		src="./resources/js/bootstrap.min.js"></script>
	<script
		src="./resources/js/bootstrap-datepicker.js"></script>
	<script
		src="./resources/js/select2.js"></script>
	<script
		src="./resources/js/bootstrap-select.js"></script>
	<script src="./resources/js/ckeditor.js"></script>
	<script src="./resources/js/cloneData.js"></script>
	<script src="./resources/js/clone2.js" ></script>
	
	</body>
</html>