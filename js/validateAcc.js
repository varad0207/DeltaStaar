const form = document.querySelector('#myForm');
const accName = document.querySelector('#accname');
const accCode = document.querySelector('#acccode');
const bldg = document.querySelector('#bldg');
const loc = document.querySelector('#loc');
const gender = document.querySelector('#gender');
const owner = document.querySelector('#owner');
const Noroom = document.querySelector('#nor');
const warden = document.querySelector('#inlineFormCustomSelectPref');

const checkAccname = () => {
    const name = accName.value.trim();
    let valid = false;
    if (name === '') {
        showError(accName, "Name cannot be blank");
    } else if (!/^[a-zA-Z\s]+$/.test(name)) {
        showError(accName, "Name is invalid");
    } else {
        showSuccess(accName);
        valid = true;
    }
    return valid;
};
const checkNOR = () => {
    const NOR = Noroom.value.trim();
    let valid = false;
    if (NOR === '') {
        showError(Noroom, "Number of rooms cannot be blank");
    } else if (!/^[0-9]+$/.test(NOR)) {
        showError(Noroom, "Number is invalid");
    } else {
        showSuccess(Noroom);
        valid = true;
    }
    return valid;
};
const checkBldgStat = () => {
    let valid = false;
    if(bldg.selectedIndex > 0) {
        showSuccess(bldg);
        valid = true;
    } else{
        showError(bldg, "Field cannot be empty");
    }
    return valid;
};
const checkWarden = () => {
    let valid = false;
    if(warden.selectedIndex > 0) {
        showSuccess(warden);
        valid = true;
    } else{
        showError(warden, "Field cannot be empty");
    }
    return valid;
};
const checkLoc = () => {
    let valid = false;
    if(loc.selectedIndex > 0) {
        showSuccess(loc);
        valid = true;
    } else{
        showError(loc, "Field cannot be empty");
    }
    return valid;
};
const checkGender = () => {
    let valid = false;
    if(gender.selectedIndex > 0) {
        showSuccess(gender);
        valid = true;
    } else{
        showError(gender, "Field cannot be empty");
    }
    return valid;
};
const checkOwner = () => {
    const Owner = owner.value.trim();
    let valid = false;
    if(Owner === '') {
        showError(owner, "Field cannot be empty");
    } else{
        showSuccess(owner);
        valid = true;
    }
    return valid;
};
const checkAccCode = () => {
    const AccCode = accCode.value.trim();
    let valid = false;
    if(AccCode === '') {
        showError(accCode, "Field cannot be empty");
    } else{
        showSuccess(accCode);
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
    if(checkAccCode() && checkAccname() && checkBldgStat() && checkLoc() && checkGender() && checkNOR() && checkWarden() && checkOwner()){
        return true;
    } else{
        alert("Please fill the required details");
        e.preventDefault();
    }
})

form.addEventListener('input', function(e) {
    switch(e.target.id) {
        case 'acccode':
            checkAccCode();
            break;
        case 'accname':
            checkAccname();
            break;
        case 'bldg':
            checkBldgStat();
            break;
        case 'gender':
            checkGender();
            break;
        case 'loc':
            checkLoc();
            break;
        case 'nor':
            checkNOR();
            break;
        case 'owner':
            checkOwner();
            break;
        case 'inlineFormCustomSelectPref':
            checkWarden();
            break;
    }
})