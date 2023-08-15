const form = document.querySelector('#myForm');
const empcode = document.querySelector('#empcode');
const fname = document.querySelector('#fname');
const mname = document.querySelector('#mname');
const lname = document.querySelector('#lname');
const email = document.querySelector('#email');
const phone = document.querySelector('#phone');
const dob = document.querySelector('#dob');
const aadhar = document.querySelector('#ano');
const pincode = document.querySelector('#pin');
const state = document.querySelector('#state');
const country = document.querySelector('#country');
const desig = document.querySelector('#desig');
const dept = document.querySelector('#dept');
// const date = new Date();
// let yr = date.getFullYear();
// let mo = date.getMonth();
// let d = date.getDate();
// ageyr = yr - 18;
dob.max = "2004-12-31";

const checkFname = () => {
    const name = fname.value.trim();
    let valid = false;
    if (name === '') {
        showError(fname, "Name cannot be blank");
    } else if (!/^[a-zA-Z0-9_\-()[\] ]+$/.test(name)) {
        showError(fname, "Name is invalid");
    } else {
        showSuccess(fname);
        valid = true;
    }
    return valid;
};
const checkMname = () => {
    const Mname = mname.value.trim();
    let valid = false;
    // if (Mname === '') {
    //     showError(mname, "Name cannot be blank");
    // } 
    if (!/^[a-zA-Z0-9_\-()[\] ]+$/.test(Mname)) {
        showError(mname, "Name is invalid");
    } else {
        showSuccess(mname);
        valid = true;
    }
    return valid;
};
const checkLname = () => {
    const Lname = lname.value.trim();
    let valid = false;
    // if (Lname === '') {
    //     showError(lname, "Name cannot be blank");
    // } 
    if (!/^[a-zA-Z0-9_\-()[\] ]+$/.test(Lname)) {
        showError(lname, "Name is invalid");
    } else {
        showSuccess(lname);
        valid = true;
    }
    return valid;
};
const checkEmail = () => {
    const Email = email.value.trim();
    let valid = false;
    if (Email === '') {
        showError(email, "Email cannot be blank");
    } else if (!/^NA|^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9-]+\.(com|in)$/.test(Email)) {
        showError(email, "Email is invalid(must contain @ and .in/.com)or should be NA");
    } else {
        showSuccess(email);
        valid = true;
    }
    return valid;
};
const checkPhone = () => {
    const Phone = phone.value.trim();
    let valid = false;
    if (Phone === '') {
        showError(phone, "Contact Number cannot be blank");
    } else if (!/^[0-9]{10}$/.test(Phone)) {
        showError(phone, "Number is invalid, enter 10 digit phone no");
    } else {
        showSuccess(phone);
        valid = true;
    }
    return valid;
};
const checkState = () => {
    const State = state.value.trim();
    let valid = false;
    const min = 3, max = 20;
    if (State === '') {
        showError(state, "State cannot be blank");
    } else if (!/^[a-zA-Z0-9_\-()[\] ]+$/.test(State)) {
        showError(state, "State is invalid");
    } else if(!isBetween(State.length,min,max)) {
        showError(state, "Min 3, Max 20 letters")
    } else {
        showSuccess(state);
        valid = true;
    }
    return valid;
};
const checkCountry = () => {
    const Country = country.value.trim();
    let valid = false;
    const min = 3, max = 25
    if (Country === '') {
        showError(country, "Country cannot be blank");
    } else if (!/^[a-zA-Z]+$/.test(Country)) {
        showError(country, "Country is invalid");
    } else if(!isBetween(Country.length,min,max)) {
        showError(country, "Min 3, Max 20 letters")
    } else {
        showSuccess(country);
        valid = true;
    }
    return valid;
};
const checkPincode = () => {
    const Pincode = pincode.value.trim();
    let valid = false;
    // if (Pincode === '') {
    //     showError(pincode, "Pincode cannot be blank");
    // } else 
    if (!/^[0-9]{6}$/.test(Pincode)) {
        showError(pincode, "Pincode is invalid, Pincode must be 6 digits");
    } else {
        showSuccess(pincode);
        valid = true;
    }
    return valid;
};
const checkAadhar = () => {
    const Aadhar = aadhar.value.trim();
    let valid = false;
    // if (Aadhar === '') {
    //     showError(aadhar, "Aadhar number cannot be blank");
    // } else 
    if (!/^[0-9]{12}$/.test(Aadhar)) {
        showError(aadhar, "Aadhar is invalid, Aadhar number must be 12 digits");
    } else {
        showSuccess(aadhar);
        valid = true;
    }
    return valid;
};
const checkDesig = () => {
    let valid = false;
    if(desig.selectedIndex > 0) {
        showSuccess(desig);
        valid = true;
    } else{
        showError(desig, "Designation cannot be empty");
    }
    return valid;
};
const checkDept = () => {
    let valid = false;
    if(dept.selectedIndex > 0) {
        showSuccess(dept);
        valid = true;
    } else{
        showError(dept, "Department cannot be empty");
    }
    return valid;
};
const checkDOB = () => {
    let valid = false;
    if(dob.val() === '') {
        showError(dob, "Date of Birth cannot be empty");
    }else{
        showSuccess(dob);
        valid = true;
    }
    return valid;
};
const isBetween = (length, min, max) => length < min || length > max ? false : true;

const showError = (input, message) => {
    const formField = input.parentElement;
    
    formField.classList.remove('success');
    formField.classList.add('error');

    const error = formField.querySelector('small');
    error.style.color = "#ff2400";
    error.textContent = message;
};

const showSuccess = (input) => {
    const formField = input.parentElement;

    formField.classList.remove('error');
    formField.classList.add('success');

    const error = formField.querySelector('small');
    error.style.color = "#0fff50";
    error.textContent = 'Field is valid';
};

form.addEventListener('submit', function(e) {
    if(checkFname() && checkMname() && checkLname() && checkPhone() && checkEmail() && checkState() && checkCountry() /*&& checkPincode()*/ && checkDesig() && checkDept() /*&& checkAadhar()*/ && checkDOB()){
        return true;
    } else{
        alert("Please fill the required details");
        e.preventDefault();
    }
})

form.addEventListener('input', function(e) {
    switch(e.target.id) {
        case 'fname':
            checkFname();
            break;
        case 'mname':
            checkMname();
            break;
        case 'lname':
            checkLname();
            break;
        case 'dob':
            checkDOB();
            break;
        case 'desig':
            checkDesig();
            break;
        case 'dept':
            checkDept();
            break;
        case 'email':
            checkEmail();
            break;
        case 'phone':
            checkPhone();
            break;
        case 'state':
            checkState();
            break;
        case 'country':
            checkCountry();
            break;
        case 'pin':
            checkPincode();
            break;
        case 'ano':
            checkAadhar();
            break;
    }
})