alert('This works');

let currentResult=0;
let result=0;
var equation =``;
var firstTimeToCall=true;

outputResult(currentResult,'');


function getUserInputNumber(){
    return parseInt(userInput.value);
}


function add(){
    if(firstTimeToCall){
        firstTimeToCall=false;
        equation = `${getUserInputNumber()}`;
        result += (getUserInputNumber());
       outputResult(result,equation);
    }else{
        equation = `${result} + ${getUserInputNumber()}`;
        result += (getUserInputNumber());
       outputResult(result,equation);
    }
}

function subtract(){
    if(firstTimeToCall){
        firstTimeToCall=false;
        equation = `${getUserInputNumber()}`;
        result -= (getUserInputNumber());
       outputResult(result,equation);
    }else{
        equation = `${result} - ${getUserInputNumber()}`;
        result -= (getUserInputNumber());
       outputResult(result,equation);
    }
}

function multiply(){
    if(firstTimeToCall){
        firstTimeToCall=false;
        equation = `${getUserInputNumber()}`;
        result *= (getUserInputNumber());
       outputResult(result,equation);
    }else{
        equation = `${result} * ${getUserInputNumber()}`;
        result *= (getUserInputNumber());
       outputResult(result,equation);
    }
}

function divide(){
    if(firstTimeToCall){
        firstTimeToCall=false;
        equation = `${getUserInputNumber()}`;
        result /= (getUserInputNumber());
       outputResult(result,equation);
    }else{
        equation = `${result} / ${getUserInputNumber()}`;
        result /= (getUserInputNumber());
       outputResult(result,equation);
    }
}

addBtn.addEventListener('click', add);
subtractBtn.addEventListener('click', subtract);
multiplyBtn.addEventListener('click', multiply);
divideBtn.addEventListener('click', divide);