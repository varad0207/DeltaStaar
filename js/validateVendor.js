const form = document.querySelector('#myForm');
const vname = document.querySelector('#vname');
const cname = document.querySelector('#cname');
const add = document.querySelector('#add');
const num = document.querySelector('#num');
const price = document.querySelector('#price');

const checkVname = () => {
    const name = vname.value.trim();
    let valid = false;
    if (name === '') {
        showError(vname, "Vendor Name cannot be blank");
    } else if (!/^[a-zA-Z0-9_\-()[\] ]+$/.test(name)) {
        showError(vname, "Vendor Name is invalid");
    } else {
        showSuccess(vname);
        valid = true;
    }
    return valid;
};
const checkCname = () => {
    const Cname = cname.value.trim();
    let valid = false;
    if (Cname === '') {
        showError(cname, "Company Name cannot be blank");
    } else if (!/^[a-zA-Z0-9_\-()[\] ]+$/.test(Cname)) {
        showError(cname, "Company Name is invalid");
    } else {
        showSuccess(cname);
        valid = true;
    }
    return valid;
};
const checkAdd = () => {
    const Add = add.value.trim();
    let valid = false;
    if (Add === ''){
        showError(add, "Address cannot be blank");
    } else {
        showSuccess(add);
        valid = true;
    }
    return valid;
};
const checkNum = () => {
    const Num = num.value.trim();
    let valid = false;
    if (Num === '') {
        showError(num, "Vendor Number cannot be blank");
    } else if (!/^[0-9]{10}$/.test(Num)) {
        showError(num, "Enter 10 digit phone number");
    } else {
        showSuccess(num);
        valid = true;
    }
    return valid;
};
const checkPrice = () => {
    const Price = price.value.trim();
    let valid = false;
    if (Price === '') {
        showError(price, "Price cannot be blank");
    } else if (!/^[0-9]+$/.test(Price)) {
        showError(price, "Field is invalid");
    } else {
        showSuccess(price);
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
    if(checkVname() && checkCname() && checkNum() && checkAdd() && checkPrice){
        return true;
    } else{
        alert("Please fill the required details");
        e.preventDefault();
    }
})

form.addEventListener('input', function(e) {
    switch(e.target.id) {
        case 'vname':
            checkVname();
            break;
        case 'cname':
            checkCname();
            break;
        case 'num':
            checkNum();
            break;
        case 'add':
            checkAdd();
            break;
        case 'price':
            checkPrice();
            break;
    }
})