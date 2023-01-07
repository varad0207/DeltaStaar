const rightName=right=>{
    let name="";
    if(right==1)name="read-only";
    else if(right==2)name="write/update";
    else if(right==4)name="delete";
    else if(right==3)name="read+write";
    else if(right==5)name="read+delete";
    else if(right==6)name="update+delete";
    return name;
}