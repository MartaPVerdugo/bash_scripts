
#!/bin/bash
# Name:grabD.sh
# Version: 1
# Date:11/11/2016
# Author: Marta Verdugo
# Usage:
#	./grabD.sh <H1> <H3> <my_file_to_filter> <mytest>
#
#	<H1> corresponds to H1 individual being tested by ANGSD -doAbbababa,
#	<H3> corresponds to H3 individual being tested by ANGSD -doAbbababa, by default H2 will be your tests 
#	<my_file_to_filter> corresponds to the txt file from ANGSD jackKnife.R you want to filter 
#	<mytest> label for the output file, i.e. your D stat test description
#
# Function: 
# takes the .txt output from the  jackKnife.R script from ANGSD and filter out the desired Dstat test of interest
#
# input: *.text
# output: *.txt


#Get arguments
H1="$1"
H3="$2"
my_file="$3"
mytest="$4"

#echo "$H1" "$H2" "$my_file" "$mytest"
# awk prints all lines starting with Sub1, *, Hariana, then awk prints out of those, those who end in Hariana only.
# end output you get the tests for Sub1, Test, Hariana, outgroup
#awk '$H1' "$my_file"

awk '/'$H1'.**.*'$H3'/' "$my_file"  | awk "\$3==\"$H3\"" > "$mytest".txt

#add header to file
sed -i '1s/^/H1 H2 H3 nABBA nBABA Dstat jackEst SE Z\n/' "$mytest".txt 

#Print finishing message
echo "Your file has been filtered"
