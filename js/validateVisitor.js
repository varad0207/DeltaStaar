const form = document.querySelector('#myForm');
const vnum = document.querySelector('#vehicle-number');
const vname = document.querySelector('#visitor-name');
const phone = document.querySelector('#visitor-phone');
const purpose = document.querySelector('#purpose-of-visit');
const vid = document.querySelector('#visitor-type');
const emp = document.querySelector('#empid');

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
const checkVehicle = () => {
    const Vehicle = vnum.value.trim();
    let valid = false;
    if (Vehicle === '') {
        showError(vnum, "Field cannot be blank");
    } else if (!/^[A-Z]{2}[0-9]{2}[A-Z]{,2}[0-9]{4}$/.test(Vehicle)) {
        showError(vnum, "Vehicle number is invalid, vehicle must be of the form eg: GA00X0000");
    } else {
        showSuccess(vnum);
        valid = true;
    }
    return valid;
};

form.addEventListener('submit', function(e) {
    if(checkEmp() && checkVname() && checkVPhone() && checkPurpose() && checkVehicle()){
        return true;
    } else{
        alert("Please fill the required details");
        e.preventDefault();
    }
})

form.addEventListener('input', function(e) {
    switch(e.target.id) {
        case 'empid':
            checkEmp();
            break;
        case 'visitor-name':
            checkVname();
            break;
        case 'visitor-phone':
            checkVPhone();
            break;
        case 'purpose-of-visit':
            checkPurpose();
            break;
        case 'vehicle-number':
            checkVehicle();
            break;
    }
})