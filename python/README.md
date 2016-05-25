# VAT-Validation
This script takes a VAT Number and using the check digits validates it

## Running the Script
After making the file executable using `chmod` run the below
```
root@shell-1:~/VAT-Validation$ ./vatvalidation.py GB339072747 
```
It's important to note the format `GB#########`

## Formula
A VAT number itself (excluding the GB) has 3-4-2 format i.e. 3 digits, a gap, four digits, a gap then 2 digits. The first 7 digits are multiplied by 8,7,6,5,4,3,and 2. Add the resulting figures. Then find the multiple of 97 which is less than the total. Find the difference and this should be equal to last 2 check digits in a valid VAT number!.

Example:

VAT registration number 339-0727-47
* 3 *8 = 24
* 3 *7 = 21
* 9 *6 = 54
* 0 *5 = 0
* 7 *4 = 28
* 2 *3 = 6
* 7 *2 = 14

Total = 147

147 - 97 = 50 - 97 = - 47
 
As the negative number (- 47) is the same as the last two digits of the VAT number, the number is valid!
