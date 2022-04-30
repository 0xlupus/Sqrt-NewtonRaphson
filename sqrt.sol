// SPDX-License-Identifier: UNLICENSED
pragma solidity >0.8.0;
// import any math lib that has a logarithm operation to ease the initial guess number or use the function that i've created below to calculate the log
// import "mathlib.sol";

contract sqrtNewton {

// function that calculates the binary log of a given number, with precision of 3 decimals
// @param _x number, can be fractional
// @return approximate binary logarithm of the number
function log (uint256 _x) internal pure returns(uint256) {
    uint256 result;
    for (uint256 delta = 1; delta < 0.001; delta = delta / 2){
        if ( _x>=2) {
            result = result + delta;
            _x = _x / 2;
        }
        _x = _x * _x; 
    }
    return result;
}

// calculates the square root of a given number
// we want to calculate the best approximation of the function s^2 - x = f(s), where s is the square root of the number x
// using the newton-raphson's method, we must determine s that makes f(s) = 0 as precise as we can
// it is calculated by iteratively doing s_n+1 = s_n - f(s_n)/f'(s_n), where f'(s) is the derivative of f(s)
// so s_n+1 = s_n - (s_n ^2 - x)/2s_n = (s_n * s_n + x)/ 2s_n
// as each iteration is gas intensive, 6 should be enough and gives good precision IMO

// however, to avoid intense computations, we must have a good initial guess and do a few manual iterations, so we can spend less gas in total
// using the log property that k^(log_k(y)) = y, let's take the binary base and y = sqrt(x)
// for simplicity, take k = 2, hence an initial guess can be 2^(log_2(x^(1/2))) = 2^(log_2(x)/2)

// @param _x int number to find square root
// @return approxiamte square root of the number using newton-raphson's method
function sqrt (uint256 _x) internal pure returns(uint256) {

if (_x == 0){
    return 0;
}

// takes initial guess for x^(1/2), then iterates through newton-raphson's method
uint256 s = 2 ** (log(_x)/2);
s = (s * s + _x)/ (2 * s);
s = (s * s + _x)/ (2 * s);
s = (s * s + _x)/ (2 * s);
s = (s * s + _x)/ (2 * s);
s = (s * s + _x)/ (2 * s);
s = (s * s + _x)/ (2 * s);

return s;
}

} 
