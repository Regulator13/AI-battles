/// @description int = scr_increment_in_bounds(variable, amount, lowerBound, upperBound, wrapAround)
/// @param variable
/// @param  amount
/// @param  lowerBound
/// @param  upperBound
/// @param  wrapAround
/* 
* Description: increments a value within a certain bound
* Parameters:  variable - variable to increment
*              amount - amount to increment or decrement by
*              lowerBound - lower bound limit
*              upperBound - upper bound limit
*              wrapAround - whether to wrap around
* Returns:     int, the new value
*/

// set input
var variable = argument0;
var amount = argument1;
var lowerBound = argument2;
var upperBound = argument3;
var wrapAround = argument4;

// increment variable
variable += amount;

// keep variable in bounds
if (variable > upperBound) {
    if (wrapAround) {
        var extra = variable - upperBound - 1;
        variable = lowerBound + extra;
        }
    else
        variable = upperBound;
    }
else if (variable < lowerBound) {
    if (wrapAround) {
        var extra = variable - lowerBound + 1;
        variable = upperBound + extra;
        }
    else
        variable = lowerBound;
    }

// return result
return variable;
