const readline = require("readline");
// 1. reader - standard setup

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const addNumbers = function addNumbers(sum, numsLeft, completionCallback){
  reader.question('Give us a number!', function(number) {
    sum += parseInt(number);
    numsLeft --;
    console.log(`your sum is ${sum}. You have ${numsLeft} nums left to add`);
    if(numsLeft === 0) {
      completionCallback(sum); //message passed below when calling func
      reader.close(); //closes program after we hit base case in recursion
    } else {
      addNumbers(sum, numsLeft, completionCallback);
    }
  });
};

addNumbers(0, 3, sum2 => console.log(`Total Sum: ${sum2}`));
//sum2 name doesn matter doesnt refer to anything in the main function definition

//to test, node addNumbers.js (ust be in the root directory)
