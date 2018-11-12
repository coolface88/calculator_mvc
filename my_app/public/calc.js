
var calculateAjax = function calculateNow(n1, operator, n2, callback) {
  var firstNum = parseFloat(n1);
  var secondNum = parseFloat(n2);
  var xhttp = new XMLHttpRequest();

  if (operator === 'add') {
     xhttp.open("GET", "add?leftoperand=" + firstNum + "&" + "rightoperand=" + secondNum, true);
  }
  if (operator === 'subtract') {
     xhttp.open("GET", "minus?leftoperand=" + firstNum + "&" + "rightoperand=" + secondNum, true);
  }
  if (operator === 'multiply') {
      xhttp.open("GET", "multiply?leftoperand=" + firstNum + "&" + "rightoperand=" + secondNum, true);
  }
  if (operator === 'divide')  {
     xhttp.open("GET", "divide?leftoperand=" + firstNum + "&" + "rightoperand=" + secondNum, true);
  }
  if (operator === 'facto') {
     xhttp.open("GET", "factorize?leftoperand=" + firstNum + "&" + "rightoperand=" + secondNum, true);
 }
 xhttp.send();
 xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
       console.log(this.responseText);
       display.textContent = this.responseText;
       returned_data = this.responseText;
       callback.apply(this, [returned_data]);
    }
 };
};

var getKeyType = function getKeyType(key) {
  var action = key.dataset.action;

  if (!action) return 'number';
  if (action === 'add' || action === 'subtract' || action === 'multiply' || action === 'divide' || action === 'facto') return 'operator';
  // For everything else, return the action
  return action;
};

var createResult = function createResultString(key, calculator, displayedNum, state) {
  var keyContent = key.textContent;
  var keyType = getKeyType(key);
     firstValue = state.firstValue,
      operator = state.operator,
      modValue = state.modValue,
      previousKeyType = state.previousKeyType;


  if (keyType === 'number') {
    return displayedNum === '0' || previousKeyType === 'operator' || previousKeyType === 'calculate' ? keyContent : displayedNum + keyContent;
  }

  if (keyType === 'decimal') {
    if (!displayedNum.includes('.')) return displayedNum + '.';
    if (previousKeyType === 'operator' || previousKeyType === 'calculate') return '0.';
    return displayedNum;
  }

  if (keyType === 'operator') {
    console.log("createResult::firstValue : "+firstValue);
    console.log("createResult::displayedNum : "+displayedNum);
    console.log("createResult::operator : "+operator);
    console.log("createResult::previoudKeyType : "+previousKeyType);
    if (keyContent === 'n!') {
      console.log('facto clicked');
      operator = "facto";
      firstValue = displayedNum;
      return calculateAjax(displayedNum, operator, firstValue, performSomeAction);
    }
    return firstValue && operator && previousKeyType !== 'operator' && previousKeyType !== 'calculate' ? calculateAjax(firstValue, operator, displayedNum, performSomeAction) : displayedNum;
  }



  if (keyType === 'clear') return 0;


  if (keyType === 'calculate') {
    //return firstValue ? previousKeyType === 'calculate' ? calculateAjax(displayedNum, operator, modValue, performSomeAction) : calculateAjax(firstValue, operator, displayedNum, performSomeAction) : displayedNum;
    if (!firstValue) {
       console.log("createResult::displayedNum firstValue == false: "+displayedNum);
       return displayedNum;
    } else if (previousKeyType === 'calculate') {
       return calculateAjax(displayedNum, operator, modValue, performSomeAction );
    } else {
       return calculateAjax(firstValue, operator, displayedNum, performSomeAction);
    }
  }
};

var calculatedValue;
var updateCalculatorState = function updateCalculatorState(key, calculator, calculatedValue, displayedNum) {
  var keyType = getKeyType(key);
  var _calculator$dataset = calculator.dataset,
      firstValue = _calculator$dataset.firstValue,
      operator = _calculator$dataset.operator,
      modValue = _calculator$dataset.modValue,
      previousKeyType = _calculator$dataset.previousKeyType;


  calculator.dataset.previousKeyType = keyType;

  if (keyType === 'operator') {
    calculator.dataset.operator = key.dataset.action;
    calculator.dataset.firstValue = firstValue && operator && previousKeyType !== 'operator' && previousKeyType !== 'calculate' ? calculatedValue : displayedNum;
    console.log("updateCalculatorState::firstValue operator===keyType "+firstValue);
    console.log("updateCalculatorState::calculatedValue operator===keyType "+calculatedValue);
    console.log("updateCalculatorState::displayedNum operator===keyType "+displayedNum);
  }

  if (keyType === 'calculate') {
    calculator.dataset.modValue = firstValue && previousKeyType === 'calculate' ? modValue : displayedNum;
    console.log("updateCalculatorState::firstValue calculate===keyType "+firstValue);
    console.log("updateCalculatorState::calculatedValue calculate===keyType "+calculatedValue);
    console.log("updateCalculatorState::displayedNum calculate===keyType"+displayedNum);
  }

  if (keyType === 'clear' && key.textContent === 'AC') {
    calculator.dataset.firstValue = '';
    calculator.dataset.modValue = '';
    calculator.dataset.operator = '';
    calculator.dataset.previousKeyType = '';
  }
};

var updateVisualState = function updateVisualState(key, calculator) {
  var keyType = getKeyType(key);
  Array.from(key.parentNode.children).forEach(function (k) {
    return k.classList.remove('is-depressed');
  });

  if (keyType === 'operator') key.classList.add('is-depressed');
  if (keyType === 'clear' && key.textContent !== 'AC') key.textContent = 'AC';
  if (keyType !== 'clear') {
    var clearButton = calculator.querySelector('[data-action=clear]');
    clearButton.textContent = 'CE';
  }
};

var returned_data;
var performSomeAction = function(returned_data) {
  console.log("performSomeAction::returned_data  "+ returned_data);
  //val = returned_data;
  calculatedValue = returned_data;
  calculator.dataset.firstValue = returned_data;
  state.firstValue = returned_data;
  updateCalculatorState(key, calculator, returned_data, displayedNum);
};

var calculator = document.querySelector('.calculator');
var display = calculator.querySelector('.calculator__display');
var keys = calculator.querySelector('.calculator__keys');
var key;
var displayedNum;
keys.addEventListener('click', function (e) {
  if (!e.target.matches('button')) return;
  key = e.target;
  // var displayedNum = display.textContent;
  // var result = createResult(key, calculator, displayedNum, calculator.dataset);
  displayedNum = display.textContent;

  result = createResult(key, calculator, displayedNum, calculator.dataset);
  //var resultString = createResultString(key, displayedNum, calculator.dataset);
  display.textContent = result;
  //display.textContent = resultString;
  updateCalculatorState(key, calculator, result, displayedNum);
  //updateCalculatorState(key, calculator, resultString, displayedNum);
  updateVisualState(key, calculator);
});
