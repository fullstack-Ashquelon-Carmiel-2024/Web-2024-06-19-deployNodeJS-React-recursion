// 5 steps
// step on each step, or jump above one step
// 12345
// 2345
// 1345
// 1245
// 245

// 1 x 2 x 3 x .... x n
function factorial(n) {

    // Exit condition - תנאי יציאה
    if (n === 0 || n === 1) {

        return 1;

    }

    // Recursive step - צעד של רקורסיה
    console.log(`going to run factorial(${n-1})`)
    return factorial(n-1)*n;

}

// n = 3, factorial(3)
// step 1: 3!==0 && 3!==1 => no exit, return factorial(2)*3
// step 2: 2!==0 && 2!==1 => no exit, return factorial(1)*2  (remember *3)
// step 3: 1!==0, but 1 === 1 => return 1 (remember *2 and *3)

function endless(n) {

    console.log(`n = ${n}`);

    endless(n+5);

}

// endless(5) // browser shouts: STACK OVERFLOW!!!!!

console.log(`factorial(6)`);
console.log(factorial(6));


/** 
 * MISSION: create recursive function power(a,n)
 * which calculates the power "n" of "a"
 * without using the operator ** or some predefined loop like "for" or "while".
 */

