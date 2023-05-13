const form = document.querySelector('#myForm');
const empcode = document.querySelector('#empcode');
const vaccCat = document.querySelector('#cat');
const doa = document.querySelector('#doa');
const loc = document.querySelector('#loc');

const checkEmpCode = () => {
    let valid = false;
    if(empcode.selectedIndex > 0) {
        showSuccess(empcode);
        valid = true;
    } else {
        showError(empcode, "Field cannot be empty");
    }
    return valid;
};
const checkCat = () => {
    let valid = false;
    if(vaccCat.selectedIndex > 0) {
        showSuccess(vaccCat);
        valid = true;
    } else {
        showError(vaccCat, "Field cannot be empty");
    }
    return valid;
};
const checkDOA = () => {
    const Doa = doa.ariaValueMax.trim();
    let valid = false;
    if(Doa === '') {
        showError(doa, "Field cannot be empty");
    } else {
        showSuccess(doa);
        valid = true;
    }
    return valid;
};
const checkLoc = () => {
    const Loc = loc.ariaValueMax.trim();
    let valid = false;
    if(Loc === '') {
        showError(loc, "Location cannot be empty");
    } else if(!/^[a-zA-Z\s]+$/.test(loc)) {
        showError(loc, "Enter valid location")
    } else {
        showSuccess(loc);
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
    if(checkEmpCode() && checkCat() && checkDOA() && checkLoc()){
        return true;
    } else{
        alert("Please fill the required details");
        e.preventDefault();
    }
})

form.addEventListener('input', function(e) {
    switch(e.target.id) {
        case 'empcode':
            checkEmpCode();
            break;
        case 'cat':
            checkCat();
            break;
        case 'doa':
            checkDOA();
            break;
        case 'loc':
            checkLoc();
            break;
    }
})