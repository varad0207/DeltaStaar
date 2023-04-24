const textReg = /^[A-Za-z]+$/;
const numReg = /^[0-9]+$/;
const emailReg = /^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9-]+\.(com|in)$/;

function validateText(t,i) {
    if(textReg.test(t) && t.length != 0){
        document.getElementsByClassName("valid-text")[i].innerHTML = "Field is valid!";
        return true;
    }
    else{
        document.getElementsByClassName("valid-text")[i].innerHTML = "Please enter only alphabtes!";
        return false;
    }
}

function validateNum(t,i) {
    if(t == document.myForm.pincode.value && t.length != 0) {
        if(numReg.test(t) && t.toString().length == 6) {
            document.getElementsByClassName("valid-num")[i].innerHTML = "Field is valid!";
        return true;
        }
        else{
            document.getElementsByClassName("valid-num")[i].innerHTML = "Please enter a valid 6 digit numeric pincode only!";
            return false;
        }
    }
    else if(t == document.myForm.contact1.value && t.length != 0) {
        if(numReg.test(t) && t.toString().length == 10) {
            document.getElementsByClassName("valid-num")[i].innerHTML = "Field is valid!";
        return true;
        }
        else{
            document.getElementsByClassName("valid-num")[i].innerHTML = "Please enter a valid 10 digit contact number only!";
            return false;
        }
    }
    else if(t == document.myForm.aadhaar_number.value && t.length != 0) {
        if((numReg.test(t) && t.toString().length == 12)) {
            document.getElementsByClassName("valid-num")[i].innerHTML = "Field is valid!";
            return true;
        }
        else{
            document.getElementsByClassName("valid-num")[i].innerHTML = "Please enter a valid 12 digit aadhar number!";
            return false;
        }
    }
    else if(t == document.myForm.salary.value && t.length != 0) {
        if(numReg.test(t)) {
            document.getElementsByClassName("valid-num")[i].innerHTML = "Field is valid!";
            return true;
        }
        else{
            document.getElementsByClassName("valid-num")[i].innerHTML = "Please enter a numeric value only!";
            return false;
        }
    }
}

function validateEmail() {
    if(emailReg.test(document.myForm.email.value) && document.myForm.email.value.length != 0) {
        document.getElementById("valid-email").innerHTML = "Field is valid!";
        return true;
    }
    else{
        document.getElementById("valid-email").innerHTML = "Please enter a valid email address!";
        return false;
    }
}

function validateEmpCode(t) {
    var d = document.getElementById("phpJS").textContent;
    console.log(d);
    // console.log(t);
}