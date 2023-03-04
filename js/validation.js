function validateEmp() {
	var t1 = t2 = t3 = t4 = t5 = t6 = t7 = t8 = t9 = t10 = false;
	const textReg = /^[A-Za-z]+$/;
    const numReg = /^[0-9]+$/;
    const emailReg = /^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$/;

    var fname = document.myForm.fname.value;
    var mname = document.myForm.mname.value;
    var lname = document.myForm.lname.value;
    var state = document.myForm.state.value;
    var country = document.myForm.country.value;
    var pincode = document.myForm.pincode.value;
    var phone = document.myForm.contact1.value;
    var email = document.myForm.email.value;
    var aadhar = document.myForm.aadhaar_number.value;
    var salary = document.myForm.salary.value;

    var pinstr = pincode.toString();
    var phonestr = phone.toString();
    var aadharstr = aadhar.toString();
    var salarystr = salary.toString();

    if(textReg.test(fname) && fname.length != ""){
    	t1 = true;
    	document.getElementById("valid-fname").innerHTML = "Field is valid!";
    }
    else
    	document.getElementById("valid-fname").innerHTML = "Enter a valid first name!";
    if(textReg.test(mname) && mname.length != ""){
    	t2 = true;
    	document.getElementById("valid-mname").innerHTML = "Field is valid!";
    }
    else
    	document.getElementById("valid-mname").innerHTML = "Enter a valid middle name!";
    if(textReg.test(lname) && lname.length != ""){
    	t3 = true;
    	document.getElementById("valid-lname").innerHTML = "Field is valid!";
    }
    else
    	document.getElementById("valid-lname").innerHTML = "Enter a valid last name!";
    if(textReg.test(state) && state.length != ""){
    	t4 = true;
    	document.getElementById("valid-state").innerHTML = "Field is valid!";
    }
    else
    	document.getElementById("valid-state").innerHTML = "Enter a valid state name!";
    if(textReg.test(country) && country.length != ""){
    	t5 = true;
    	document.getElementById("valid-country").innerHTML = "Field is valid!";
    }
    else
    	document.getElementById("valid-country").innerHTML = "Enter a valid country name!";
    if(numReg.test(pincode) && pinstr.length == 6){
    	t6 = true;
    	document.getElementById("valid-pincode").innerHTML = "Field is valid!";
    }
    else
    	document.getElementById("valid-pincode").innerHTML = "Enter a valid 6 digit pincode!";
    if(numReg.test(phone) && phonestr.length == 10){
    	t7 = true;
    	document.getElementById("valid-phone").innerHTML = "Field is valid!";
    }
    else
    	document.getElementById("valid-phone").innerHTML = "Enter a valid 10 digit phone number!";
    if(emailReg.test(email) && email.length != ""){
    	t8 = true;
    	document.getElementById("valid-email").innerHTML = "Field is valid";
    }
    else
    	document.getElementById("valid-email").innerHTML = "Enter a valid email address!";
    if((numReg.test(aadhar) && aadharstr.length == 16) || aadharstr.length == ""){
    	t9 = true;
    	document.getElementById("valid-aadhar").innerHTML = "Field is valid!";
    }
    else
    	document.getElementById("valid-aadhar").innerHTML = "Enter a valid 16 digit aadhar number!";
    if(numReg.test(salary) || salarystr.length == ""){
    	t10 = true;
    	document.getElementById("valid-salary").innerHTML = "Field is valid!";
    }
    else
    	document.getElementById("valid-salary").innerHTML = "Enter a valid salary!";

    if(t1 && t2 && t3 && t4 && t5 && t6 && t7 && t8 && t9 && t10)
    	return true;
    else
    	return false;
} 

function validateAcc() {
    var t1 = t2 = false;
    const textReg = /^[A-Za-z]+$/;
    const numReg = /^[0-9]+$/;

    var accname = document.myForm.name.value;
    var rooms = document.myForm.nor.value;

    if(textReg.test(accname)){
        t1 = true;
        document.getElementById("valid-accname").innerHTML = "Field is valid!";
    }
    else
        document.getElementById("valid-accname").innerHTML = "Enter a valid accommodation name!";
    if(numReg.test(rooms)){
        t2 = true;
        document.getElementById("valid-room").innerHTML = "Field is valid!";
    }
    else
        document.getElementById("valid-room").innerHTML = "Enter a valid number of rooms!";

    if(t1 && t2)
        return true;
    else
        return false;
}

function validateRoom() {
    var t1 = t2 = false;
    const numReg = /^[0-9]+$/;

    var roomno = document.myForm.room_no.value;
    var roomcap = document.myForm.room_cap.value;

    if(numReg.test(roomno)){
        t1 = true;
        document.getElementById("valid-roomno").innerHTML = "Field is valid";
    }
    else
        document.getElementById("valid-roomno").innerHTML = "Enter a valid room number!";
    if(numReg.test(roomcap)){
        t2 = true;
        document.getElementById("valid-roomcap").innerHTML = "Field is valid!";
    }
    else
        document.getElementById("valid-roomcap").innerHTML = "Enter a valid room capacity!";

    if(t1 && t2)
        return true;
    else
        return false;
}

function validateTanker() {
    const numReg = /^[0-9]+$/;

    var qty = document.myForm.qty.value;

    if(numReg.test(qty)){
        document.getElementById("valid-qty").innerHTML = "Field is valid!";
        return true;
    }
    else{
        document.getElementById("valid-qty").innerHTML = "Enter a valid quantity!";
        return false;
    }
}

function validateAccLoc() {
    const textReg = /^[A-Za-z]+$/;

    var accloc = document.myForm.loc.value;

    if(textReg.test(accloc)){
        document.getElementById("valid-field").innerHTML = "Field is valid!";
        return true;
    }
    else{
        document.getElementById("valid-field").innerHTML = "Enter a valid input!";
        return false;
    }
}

function validateEmpDept() {
    const textReg = /^[A-Za-z]+$/;

    var empdept = document.myForm.dept.value;

    if(textReg.test(empdept)){
        document.getElementById("valid-field").innerHTML = "Field is valid!";
        return true;
    }
    else{
        document.getElementById("valid-field").innerHTML = "Enter a valid input!";
        return false;
    }
}

function validateEmpDesig() {
    const textReg = /^[A-Za-z]+$/;

    var empdesig = document.myForm.designation.value;

    if(textReg.test(empdesig)){
        document.getElementById("valid-field").innerHTML = "Field is valid!";
        return true;
    }
    else{
        document.getElementById("valid-field").innerHTML = "Enter a valid input!";
        return false;
    }
}

function validateVacCat() {
    const textReg = /^[A-Za-z]+$/;

    var vacccat = document.myForm.category_name.value;

    if(textReg.test(vacccat)){
        document.getElementById("valid-field").innerHTML = "Field is valid!";
        return true;
    }
    else{
        document.getElementById("valid-field").innerHTML = "Enter a valid input!";
        return false;
    }
}

function validateTankerVendor() {
    var t1 = t2 = t3 = t4 = false;
    const textReg = /^[A-Za-z]+$/;
    const numReg = /^[0-9]+$/;

    var vname = document.myForm.vname.value;
    var cname = document.myForm.cname.value;
    var num = document.myForm.num.value;
    var add = document.myForm.add.value;

    if(textReg.test(vname)){
        document.getElementById("valid-vname").innerHTML = "Field is valid!";
        t1 = true;
    }
    else
        document.getElementById("valid-vname").innerHTML = "Enter a valid vendor name";
    if(textReg.test(cname)){
        document.getElementById("valid-cname").innerHTML = "Field is valid!";
        t2 = true;
    }
    else
    document.getElementById("valid-cname").innerHTML = "Enter a valid company name";
    if(numReg.test(num)){
        document.getElementById("valid-num").innerHTML = "Field is valid!";
        t3 = true;
    }
    else
        document.getElementById("valid-num").innerHTML = "Enter a valid vendor number";
    if(add.length != ""){
        document.getElementById("valid-add").innerHTML = "Field is valid!";
        t4 = true;
    }
    else
        document.getElementById("valid-add").innerHTML = "Enter a valid address";

    if(t1 && t2 && t3 && t4)
        return true;
    else
        return false;
}