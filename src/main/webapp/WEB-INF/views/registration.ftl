
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- External  css -->
<link rel="stylesheet" href="./resources/css/registration.css">

<link rel="stylesheet" href="./resources/css/registration_inline.css">

<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/js/jquery-3.6.0.min.js">

<link rel="stylesheet" type="text/css"
	href="./resources/css/bootstrap-datepicker.css">
<style>
#imgPreview {
	width: 150px;
	height: 200px;
	border: 1px solid black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


<body>
	<form class="signup-form" id="registerform" modelAttribute="user"
		action="SaveUser" method="post" enctype='multipart/form-data'>


		<!-- form header -->
		<div class="form-header">
			<h1>Register</h1>
		</div>

		<!-- form body -->
		<div class="form-body">
			<input type="hidden" name="id" value="${userObject.id!""}">


			<!-- Firstname and Lastname -->
			<div class="horizontal-group">
				<div class="form-group left">
					<label for="first_name" class="label-title">First name *</label> <input
						path="firstname" id="firstname" name="firstname"
						value="${userObject.firstname!" "}"
						class="form-input"
						placeholder="enter your first name" />


				</div>
				<div class="form-group right">
					<label for="lastname" class="label-title">Last name</label> <input
						type="text" path="lastname" value="${userObject.lastname!"
						"}" id="lastname" name="lastname" class="form-input"
						placeholder="enter your last name" />
				</div>
			</div>

			<!-- Dob and Phone no -->
			<div class="horizontal-group">
				<div class="form-group left">
					<label for="Date" class="label-title"> DOB </label> <input
						type="date" path="dob" id="datepicker" value="${userObject.dob!"
						"}" class="form-input" name="dob" placeholder="enter your DOB">
				</div>
				<div class="form-group right">
					<label for="phone no" class="label-title">Phone No</label> <input
						type="number" path="mobileno" class="form-input" id="phoneno"
						value="${userObject.mobileno!"
						"}"
						placeholder="enter your phone no" name="mobileno"
						required="required">
				</div>
			</div>


			<!-- Email -->
			<div class="form-group">
				<label for="email" class="label-title">Email*</label> <input
					type="email" path="email" id="email" name="email"
					value="${userObject.email!" "}"
					class="form-input"
					placeholder="enter your email">

			</div>

			<!-- Passwrod and confirm password -->
			<div class="horizontal-group">
				<div class="form-group left">
					<label for="password" class="label-title">Password *</label> <input
						path="password" type="password" value="${userObject.password!"
						"}"  id="password" class="form-input" name="password"
						placeholder="enter your password" required="required">
				</div>
				<div class="form-group right">
					<label for="confirm-password" class="label-title">Confirm
						Password *</label> <input type="password" class="form-input"
						path="passwordConfirm" value="${userObject.passwordConfirm!"
						"}" id="cpassword" name="passwordConfirm"
						placeholder="enter your password again" required="required">

				</div>
			</div>
			<!-- Gender and Hobbies -->

			<div class="horizontal-group">
				<div class="form-group left">
					<label class="label-title">Gender:</label>
					<div class="input-group">
						<label for="male"><input type="radio" name="gender"
							path="gender" value="male" id="male"> Male</label> <label
							for="female"><input path="gender" type="radio"
							name="gender" value="female" id="female"> Female</label>
					</div>
				</div>
				<div class="form-group right">
					<label class="label-title">Hobbies</label>
					<div>
						<select class="form-control" id="hobby" name="hobby">
							<option value="not" name="hobby">Select Hobby</option>
							<option value="Cricket">Cricket</option>
							<option value="BasketBall">BasketBall</option>
							<option value="Hockey">Hockey</option>
						</select>
					</div>
				</div>
			</div>

			<!-- Profile picture and Age -->
			<div class="form-group">
				<div id="form-group left">
					<label for="choose-file" class="label-title">Upload Profile
						Picture</label> <input type="file" path="image" name="image"
						id="choose-file">
					<div id="img-view">
				<#if userObject.email??><img id='imgPreview'  alt='Profile preview' src="data:image/jpg;base64,${userObject.imageBase64!""}" width='100%' height='100%'/></#if>					
									
					</div>
				</div>
			</div>


			<div class="addresses">
				
			<#list userObject.address![] as address>

				<div class="form-group address-section">
					<label for="address">Address :</label> 
					
					<input type="hidden"
						name="Address[${address?index!""}].id" value="${address.id!""}">

					<label class="control-label" for="address_line_one_0">Address
						line 1</label> <input type="text" id="address_line_one_0"
						class="form-control addresstest" name="Address[${address?index!""}].Address1" value="${address.address1!""}" maxlength="255">

					<div class="add-style">
						<span> <label class="control-label"
							for="address_line_one_0">city</label> <select
							class="form-control" id="city${address?index!" "}" name="Address[${address?index!""}].city">
								<option value="not">Select City</option>
								<option value="Pune">pune</option>
								<option value="Ahmedabad">Ahmedabad</option>
								<option value="Surat">Surat</option>
								<option value="Amreli">Amreli</option>
						</select></span> <span> <label class="control-label" for="country">State</label>
							<select class="form-control" name="Address[${address?index!""}].state" id="state${address?index!""}">
								<option value="not">Select State</option>
								<option value="Gujarat">Gujarat</option>
								<option value="Mumbai">Mumbai</option>
								<option value="MP">MP</option>
								<option value="UP">UP</option>
						</select>
						</span> <span> <label class="control-label" for="city_0">Area</label>
							<input type="text" id="city_0" class="form-control"
							name="Address[${address?index!" "}].area" value="${address.area!""}" maxlength="64">

						</span> <span> <label class="control-label" for="city_0">Postal
								code</label> <input type="number" id="state_0" class="form-control"
							name="Address[${address?index!""}].postalcode" value="${address.postalcode!" "}" maxlength="64">
						</span> <span> <a href="javascript:void(0);"
							class="list_remove_button btn btn-danger">Remove</a></span>
					</div>
				</div>
				<script type="text/javascript">
						$("#state${address?index}").val ("${address.state}");
						$("#city${address?index}").val ("${address.city}");
					</script> 
			<#else>
				<div class="form-group address-section">
					<label for="address">Address :</label> <label class="control-label"
						for="address_line_one_0">Address line 1</label> <input type="text"
						id="address_line_one_0" class="form-control addresstest"
						name="Address[0].Address1" maxlength="255">

					<div class="add-style">
						<span> <label class="control-label"
							for="address_line_one_0">city</label> <select
							class="form-control" id="city" name="Address[0].city">
								<option value="not">Select City</option>
								<option value="Pune">pune</option>
								<option value="Ahmedabad">Ahmedabad</option>
								<option value="Surat">Surat</option>
								<option value="Amreli">Amreli</option>
						</select></span> <span> <label class="control-label" for="country">State</label>
							<select class="form-control" name="Address[0].state" id="state">
								<option value="not">Select State</option>
								<option value="Gujarat">Gujarat</option>
								<option value="Mumbai">Mumbai</option>
								<option value="MP">MP</option>
								<option value="UP">UP</option>
						</select>
						</span> <span> <label class="control-label" for="city_0">Area</label>
							<input type="text" id="city_0" class="form-control"
							name="Address[0].area" maxlength="64">

						</span> <span> <label class="control-label" for="city_0">Postal
								code</label> <input type="number" id="state_0" class="form-control"
							name="Address[0].postalcode" maxlength="64">
						</span> <span> <a href="javascript:void(0);"
							class="list_remove_button btn btn-danger">Remove</a></span>
					</div>
				</div>
				</#list>
			</div>
			<div>
					<a href="javascript:void(0);" class="Add_add_button">Add more address</a>
				</div>
			
			<!-- form-footer -->
			<div class="form-footer">
				<span>* required</span>
				<button type="submit" id="Rbtn" class="btn">Create</button>
			</div>
	</form>

	<script type="text/javascript">
		$('.Add_add_button').on('click', function() {
			addAddress();
		});

		$('.addresses').on('click', '.list_remove_button', function() {
			removeAddress(this);
		});
		var numOfAddress = $('.addresstest').length - 1;
		function addAddress() {
			numOfAddress++;
			console.log("Hello from  : " + numOfAddress);

			console.log("Hello from add");
			var list_fieldHTML = '<div class="form-group"><label for="address">Address:'
					+ '</label> <label class="control-label" for="address_line_one_0">Address line 1</label> <input type="text" id="address_line_one_0" class="form-control addresstest" name="Address['+numOfAddress+'].Address1" maxlength="255">'
					+'<div class="add-style"><span> <label class="control-label" for="address_line_one_0">city</label> <select class="form-control" id="city" name="Address['+numOfAddress+'].city">'
					+'<option value="not">Select City</option><option value="Pune">pune</option><option value="Ahmedabad">Ahmedabad</option><option value="Surat">Surat</option><option value="Amreli">Amreli</option>'
					+'</select></span> <span> <label class="control-label" for="country">State</label><select class="form-control" name="Address['+numOfAddress+'].state" id="state">'
					+'<option value="not">Select State</option><option value="Gujarat">Gujarat</option><option value="Mumbai">Mumbai</option><option value="MP">MP</option><option value="UP">UP</option>'
					+'</select></span> <span> <label class="control-label" for="city_0">Area</label><input type="text" id="city_0" class="form-control" name="Address['+numOfAddress+'].area" maxlength="64"></span> <span>'
					+'<label class="control-label" for="city_0">Postal code</label> <input type="number" id="state_0" class="form-control" name="Address['+numOfAddress+'].postalcode" maxlength="64"> </span> '
					+'<span> <a href="javascript:void(0);" class="list_remove_button btn btn-danger">Remove</a></span> </div><input type="hidden"  name="newOldStatus" value="new"></div>';
			$('.addresses').append(list_fieldHTML); //Add field html
		}
		function removeAddress(element) {
			if ($('.addresstest').length > 1) {
				$(element).parent().parent().parent().remove(); //Remove field html
			}
		}
		$(document).ready(function(){
			<#if userObject.email??>
				$("input[name=gender][value=${userObject.gender}]").prop("checked",true);	
				$("#hobby").val ("${userObject.hobby!""}"); 
			</#if>
		
	 });
		$('#choose-file').change(function(){
	        const file = this.files[0];
	        if (file){
	          let reader = new FileReader();
	          reader.onload = function(event){
	        	$("#img-view").html($("<img id='imgPreview'  alt='Profile preview' width='100%' height='100%'/>"));
	            $('#imgPreview').attr('src', event.target.result);
	          }
	          reader.readAsDataURL(file);
	        }
	 });
			
	</script>

	<script src="./resources/js/jquery.min.js"></script>
	<script src="./resources/js/popper.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/bootstrap-datepicker.js"></script>
	<script src="./resources/js/bootstrap-select.js"></script>
	</body>
</html>