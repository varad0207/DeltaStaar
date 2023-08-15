const form = document.querySelector('#myForm');
const acc = document.querySelector('#acc');
const ven = document.querySelector('#ven');
const sec = document.querySelector('#sec');
const quality = document.querySelector('#quality');
const qty = document.querySelector('#qty');
const amt = document.querySelector('#amt');
const challan = document.querySelector('#challan');

const checkAcc = () => {
    let valid = false;
    if(acc.selectedIndex > 0) {
        showSuccess(acc);
        valid = true;
    } else{
        showError(acc, "Accommodation cannot be empty");
    }
    return valid;
};
const checkSec = () => {
    let valid = false;
    if(sec.selectedIndex > 0) {
        showSuccess(sec);
        valid = true;
    } else{
        showError(sec, "Security cannot be empty");
    }
    return valid;
};
const checkVen = () => {
    let valid = false;
    if(ven.selectedIndex > 0) {
        showSuccess(ven);
        valid = true;
    } else{
        showError(ven, "Vendor cannot be empty");
    }
    return valid;
};
const checkQuality = () => {
    let valid = false;
    if(quality.selectedIndex > 0) {
        showSuccess(quality);
        valid = true;
    } else{
        showError(quality, "Field cannot be empty");
    }
    return valid;
};
const checkQty = () => {
    const Qty = qty.value.trim();
    let valid = false;
    if (Qty === '') {
        showError(qty, "Field cannot be blank");
    } else if (!/^[0-9]*$/.test(Qty)) {
        showError(qty, "Field is invalid, enter numeric values only");
    } else {
        showSuccess(qty);
        valid = true;
    }
    return valid;
};
const checkAmt = () => {
    const Amt = amt.value.trim();
    let valid = false;
    if (Amt === '') {
        showError(amt, "Field cannot be blank");
    } else if (!/^[0-9]*$/.test(Amt)) {
        showError(amt, "Field is invalid, enter numeric values only");
    } else {
        showSuccess(amt);
        valid = true;
    }
    return valid;
};
const checkChallan = () => {
    const Challan = challan.value.trim();
    let valid = false;
    if (Challan === '') {
        showError(challan, "Field cannot be blank");
    } else if (!/^[a-zA-Z0-9_\-()[\] ]+$/.test(Challan)) {
        showError(challan, "Field is invalid, challan should be of type XX-0000");
    } else {
        showSuccess(challan);
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
    if(checkAcc() && checkSec() && checkVen() && checkQuality() && checkQty() && checkChallan() && checkAmt()){
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
        case 'sec':
            checkSec();
            break;
        case 'ven':
            checkVen();
            break;
        case 'quality':
            checkQuality();
            break;
        case 'qty':
            checkQty();
            break;
        case 'challan':
            checkChallan();
            break;
        case 'amt':
            checkAmt();
            break;
    }
})