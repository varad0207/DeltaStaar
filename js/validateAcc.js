const textReg = /^[A-Za-z]+$/;
const numReg = /^[0-9]+$/;

function validateText() {
    if(textReg.test(document.myForm.name.value) && document.myForm.name.value.length != 0) {
        document.getElementById("valid-accname").innerHTML = "Field is valid!";
        return true;
    }
    else{
        document.getElementById("valid-accname").innerHTML = "Please enter only alphabtes!";
        return false;
    }
}

function validateNum(t,i) {
    if(numReg.test(t) && t.length != 0) {
        document.getElementsByClassName("valid-field")[i].innerHTML = "Field is valid!";
        return true;
    }
    else{
        document.getElementsByClassName("valid-field")[i].innerHTML = "Please enter numeric values only!";
        return false;
    }
}