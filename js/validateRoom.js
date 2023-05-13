const form = document.querySelector('#myForm');
const acc = document.querySelector('#acc');
const rommno = document.querySelector('#roomno');
const rommcap = document.querySelector('#roomcap');

const checkAcc = () => {
    let valid = false;
    if(acc.selectedIndex > 0) {
        valid = true;
        showSuccess(acc);
    } else{
        showError(acc, "Please select a Accommodation");
    }
    return valid;
};
const checkNo = () => {
    const No = rommno.value.trim();
    let valid = false;
    if(No === '') {
        showError(rommno, "Field cannot be empty");
    } else if(!/^[0-9]+$/.test(No)) {
        showError(rommno, "Invalid room number");
    } else {
        showSuccess(rommno);
        valid = true;
    }
    return valid;
};
const checkCap = () => {
    const Cap = rommcap.value.trim();
    let valid = false;
    if(Cap === '') {
        showError(rommcap, "Field cannot be empty");
    } else if(!/^[0-9]+$/.test(No)) {
        showError(rommcap, "Invalid room capacity");
    } else {
        showSuccess(rommcap);
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
    if(checkAcc() && checkNo() && checkCap()){
        return true;
    } else{
        alert("Please fill the required details");
        e.preventDefault();
    }
})

form.addEventListener('input', function(e) {
    switch(e.target.id) {
        case 'acc':
            checkAcc();
            break;
        case 'roomno':
            checkNo();
            break;
        case 'roomcap':
            checkCap();
            break;
    }
})