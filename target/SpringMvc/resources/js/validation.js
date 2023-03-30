$(document).ready(function(){
$("#alertSuccess").hide();
	$("#errname").hide();
	$("#errlastname").hide();
	$("#errphoneno").hide();
	$("#erremail").hide();  //Initially hiding the error spans
	$("#errpass").hide();
	$("#errdate").hide();
	$("#Rbtn").click(function() {
		
		var firstname=$("#firstname").val();
		var lastname=$("#lastname").val();
		var phonno=$("#phoneno").val();
		var password=$("#password").val(); //triggers on click of register
		var email=$("#email").val();
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var letters = /^[A-Za-z]+$/;

		/*
		 if(firstname==null || firstname==""){
			alert("firstname cannot be Empty");
			return false;
		}else if(lastname==null || lastname==""){
			alert("lastname cannot be Empty");
			return false;
		}else if(phonno==null || phonno==""){
			alert("phone cannot be Empty");
			return false;
		}
		else if(password=="" || password==null){
			alert("Password cannot be Empty");
			return false;
			
		}else if(email=="" || email==null){
			
			alert("Email cannot be Empty");
			return false;
		}else if(!(email.match(mailformat))){
			alert("Please Enter Valid Mail ID");

		return false;
		}else if(!(firstname.match(letters))){
			alert("Pleas Enter only Characters for firstname");
			return false;
		}else{
			$("#alertSuccess").show();
			$("#formid").submit();
			return true;
		}*/	
	});

	/*Firstname validation */
	$("#firstname").keyup(function(){
		var firstname=$("#firstname").val();
		 var letters = /^[A-Za-z]+$/;
	
		 if(!(firstname.match(letters))){
			 $("#errname").show();
			 return false;
			}else{
				$("#errname").hide();
				return true;
			}
	});
	/*last validation */
		$("#lastname").keyup(function(){
		var lastname=$("#lastname").val();
		 var letters = /^[A-Za-z]+$/;

		 if(!(lastname.match(letters))){
			 $("#errlastname").show();
			 return false;
			}else{
				$("#errlastname").hide();
				return true;
			}
	});
		
	/*phone validation */
		$("#phoneno").keyup(function(){
		var phoneno=$("#phoneno").val();
		
	 	 if(!(phone_validate(phoneno))){
			 $("#errphoneno").show();
			 return false;
			}else{
				$("#errphoneno").hide();
				return true;
			}
	});
	function phone_validate(mobilephoneno) 
	{ 
	  var checkPattern =new RegExp(/^[0-9-+]+$/);
	  return checkPattern.test(mobilephoneno); 
	}
	/*email validation */
	$("#email").keyup(function(){
		var email=$("#email").val();
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		if(!(email.match(mailformat))){
			 $("#erremail").show();
		return false;
		}else{
			 $("#erremail").hide();
		return true;		
		}
	});
	
	/* adddress validation */
	/*password validation */
	$("#cpassword").change(function(){
		var password=$("#password").val();
		var cpassword=$("#cpassword").val();
		if(!(password==cpassword)){
			 $("#errpass").show();
			return false;	
		}else{
			 $("#errpass").hide();
			return true;
		}		
	});	
	
	 
	//TO check date is smaller than current date
	$(function () {
	    $("#datepicker").on('change', function () {
	        var date = Date.parse($(this).val());
	        if (date > Date.now()) {
	            alert('Selected date must be greater than today date');
	            $(this).val('');
	        }
	    });
	});
	// To check image is only jpg pneg and png
	$('#uploadButton').change(function () {
	    var ext = this.value.match(/\.(.+)$/)[1];
	    switch (ext) {
	        case 'jpg':
	        case 'jpeg':
	        case 'png':
	        case 'gif':
	            $('#uploadButton').attr('disabled', false);
	            break;
	        default:
	            alert('This is not an allowed file type.');
	            this.value = '';
	    }
	});
    
    
	$("email").change(function(){
		var email = S('#email').val();
		$.ajax({
			type:"POST",
			data:{email:email},
			url:"emailcheck",
			success: function(erremail){
				$('erremail').html(result);
			}
		});
	});
    
});
