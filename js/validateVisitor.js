const form = document.querySelector('#myForm');
const vnum = document.querySelector('#empVNo');
const nvnum = document.querySelector('#nempVNo');
const vname = document.querySelector('#visitor');
const phone = document.querySelector('#visitor-phone');
const purpose = document.querySelector('#empPurpose');
const npurpose = document.querySelector('#nempPurpose');
const vid = document.querySelector('#visitor-type');
const emp = document.querySelector('#empid');

const checkVisitor = () => {
    let valid = false;
    if(vid.selectedIndex > 0) {
        showSuccess(vid);
        valid = true;
    } else{
        showError(vid, "Select a type");
    }
    return valid;
};
const checkEmp = () => {
    let valid = false;
    if(emp.selectedIndex > 0) {
        showSuccess(emp);
        valid = true;
    } else{
        showError(emp, "Field cannot be empty");
    }
    return valid;
}
const checkVname = () => {
    const name = vname.value.trim();
    let valid = false;
    if (name === '') {
        showError(vname, "Name cannot be blank");
    } else if (!/^[a-zA-Z\s]+$/.test(name)) {
        showError(vname, "Name is invalid");
    } else {
        showSuccess(vname);
        valid = true;
    }
    return valid;
};
const checkVPhone = () => {
    const Phone = phone.value.trim();
    let valid = false;
    if (Phone === '') {
        showError(phone, "Contact Number cannot be blank");
    } else if (!/^[0-9]{10}$/.test(Phone)) {
        showError(phone, "Number is invalid, enter a 10 digit phone number");
    } else {
        showSuccess(phone);
        valid = true;
    }
    return valid;
};
const checkPurpose = () => {
    const Purpose = purpose.value.trim();
    let valid = false;
    if (Purpose === '') {
        showError(purpose, "Field cannot be blank");
    } else {
        showSuccess(purpose);
        valid = true;
    }
    return valid;
};
const checkNVehicle = () => {
    const NVehicle = nvnum.value.trim();
    let valid = false;
    if (NVehicle === '') {
        showError(nvnum, "Field cannot be blank");
    } else if (!/^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}$/.test(NVehicle)) {
        showError(nvnum, "Vehicle number is invalid, vehicle must be of the form eg: GA00X0000");
    } else {
        showSuccess(nvnum);
        valid = true;
    }
    return valid;
};
const checkNPurpose = () => {
    const NPurpose = npurpose.value.trim();
    let valid = false;
    if (NPurpose === '') {
        showError(npurpose, "Field cannot be blank");
    } else {
        showSuccess(npurpose);
        valid = true;
    }
    return valid;
};
const checkVehicle = () => {
    const Vehicle = vnum.value.trim();
    let valid = false;
    if (Vehicle === '') {
        showError(vnum, "Field cannot be blank");
    } else if (!/^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}$/.test(Vehicle)) {
        showError(vnum, "Vehicle number is invalid, vehicle must be of the form eg: GA00X0000");
    } else {
        showSuccess(vnum);
        valid = true;
    }
    return valid;
};
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
    if(checkVisitor() && checkEmp() && checkVname() && checkVPhone() && checkPurpose() && checkVehicle()){
        return true;
    } else{
        alert("Please fill the required details");
        e.preventDefault();
    }
})

form.addEventListener('input', function(e) {
    switch(e.target.id) {
        case 'visitor-type':
            checkVisitor();
            break;
        case 'empid':
            checkEmp();
            break;
        case 'visitor':
            checkVname();
            break;
        case 'visitor-phone':
            checkVPhone();
            break;
        case 'empPurpose':
            checkPurpose();
            break;
        case 'empVNo':
            checkVehicle();
            break;
    }
})