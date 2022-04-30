# Sqrt-NewtonRaphson
Custom Square Root algorithm in solidity using Newthon Raphson Method

Function to calculate the square root of a number.

Using the newton-raphson's method, we want to calculate the best approximation to the root of the function f(s) = s^2 - x = 0, where s is the square root we want to know and x is the input. 
It is done iteratively through the formula s_n+1 = s_n - f(s_n)/f'(s_n), where f' is the derivative of f
playing with the expression, we come to s_n+1 = (s_n ^2 + x)/( 2 * s_n)
However, since we're dealing with solidity, it is good that we do few iterations to avoid high cas consumption, as well as have a good initial guess to also do a smaller number of iterations

This way, to determine a good initial guess, i've thought about getting a initial calculation of 2^(1/2) through a logarithm calculation, using the properties:  "b ^ (log_b (a)) = a" as well as "log(b^a) = a * log(b)", so do "b = 2" (binary base) and "a = sqrt(x) = x^(1/2)" and we get:
                initial_guess = 2^(log_2(x) / 2);

But, I stil need a method to calculate the binary logarithm of x, so I tried to implement a custom function to do it, but it can be done importing any library that does this calculation

Finally, given that we know the log_2 of x, we can do 6 iterations of the newton-raphson's method so we're able to determine the square root of a given number, whether it is integer or fractional.


