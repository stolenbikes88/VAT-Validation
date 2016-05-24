# VAT-Validation
This script takes a VAT Number and using the check digits validates it

## Running the Script
TBC

## Formula
A VAT number has 3-4-2 format i.e. 3 digits, a gap, four digits, a gap then 2 digits. The first 7 digits are multiplied by 8,7,6,5,4,3,and 2. Add the resulting figures. Then find the multiple of 97 which is less than the total. Find the difference and this should be equal to last 2 check digits in a valid VAT number!.

Example:
VAT NO: 123-4567-15
* 1*8=8
* 2*7=14
* 3*6=18
* 4*5=20
* 5*4=20
* 6*3=18
* 7*2=14

Total: 112

1 * 97 = 97, difference = 15 and this is equal to the last two check digits!

The formula works but the VAT number should be validated with C&E to avoid fraud!
