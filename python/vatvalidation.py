#!/usr/bin/python
import sys

if __name__ == '__main__':
  vatnumber = sys.argv[1]
  
  #Check VAT Number is right number of characters for the format I'm using (not going to bother checking the actual format)
  if(len(vatnumber) != 11):
    print "Please supply VAT Number in the format GB123456715"
    exit()
    
  #split the VAT Number into the check digits and the rest
  checkdigit = int('-'+vatnumber[-2:])
  rest = vatnumber[2:9]
  
  ## Now start the formula
  multi = 8
  total = 0
  
  for c in rest:
    total += int(c) * multi
    multi -= 1
    
  while (total > 0):
    total -= 97
    
  if (total == checkdigit):
    print "Valid VAT Number"
  else:
    print "Bad VAT Number"
