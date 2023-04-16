#!/bin/bash
echo "Welcome to our program"
menu(){
printf "\n\nPlease choose letter to make the specific operation from the following menu\n"
printf "\n\n************** MENU **************\n"
printf "\nE: for Encryption
D: for Decryption
X: Exit\n"
printf "Please enter the letter\n"
}
checkIfFileExist(){
while true # while statement that keep running until user enter an exist file
do
if [ -e "$file" ] # if statement to check if the file is exist or not
then
printf "\n--->The file name u entered is exist\n"
break
else
printf "\n--->the file name that u entered is not exist , please enter right file name \n"
read file
fi # end of if statement that check if file exist or not
done
}
menu
Encryption(){
cat /dev/null > cipher.txt
echo "Please insert the name of plain file:"
read file #reading the file name before entering if statement
checkIfFileExist
charcheck=$(cat $file | grep "[^A-Za-z ]") # check if the file contain any number or not
if [ -n "$charcheck" ]
then
printf " Error ==> There is at least a number or special character in your input file
please check your file and get back to the program\n"
exit
else
printf "All the file data is true and there is no numbers or special characters\n"
fi # end of if statement that check if there is any character
declare -a arrayOfMods
counter=0
letterIndex=0
ALPHABET=(Aa Bb Cc Dd Ee Ff Gg Hh Ii Jj Kk Ll Mm Nn Oo Pp Qq Rr Ss Tt Uu Vv Ww Xx Yy Zz)
for i in $(cat $file | tr " " "\n")
do
for j in ${ALPHABET[@]}
do
((++letterIndex))
if [ "$(echo $i | grep [$j])" ]
then
repeat=$(echo $i | tr -cd [$j] | wc -c)
((sum+=letterIndex*repeat))
arrayOfMods[$counter]=$(($sum%256))
fi
done
counter=$(($counter+1))
letterIndex=0
sum=0
done
key=${arrayOfMods[0]}
for k in ${arrayOfMods[@]}
do
if [ $k -gt $key ]
then
key=$k
fi
done
echo "The Key In Decimal= " $key
x=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
binaryKey=${x[$key]}
echo "The Key In Binary= " $binaryKey
########## XOR with Swap operations ###############
declare -a arrayOfChars
declare -a arrayOfXORs
counter=0
convertToBinary(){
x=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
binaryKey=${x[$tmp]}
arrayOfXORs[$counter]=$binaryKey
counter=$(($counter+1))
}
for i in $(cat $file | tr "\n" "@" | tr " " "_")
do
echo $i | sed 's/\(.\)/\1\n/g' >> temp_$$
done
counter=0
for j in $(cat temp_$$)
do
arrayOfChars[$counter]=$j
((counter++))
done

rm temp_$$
for k in ${arrayOfChars[@]}
do
case $k in
A)tmp=$((65^$key))
convertToBinary
;;
B)tmp=$((66^$key))
convertToBinary
;;
C)tmp=$((67^$key))
convertToBinary
;;
D)tmp=$((68^$key))
convertToBinary
;;
E)tmp=$((69^$key))
convertToBinary
;;
F)tmp=$((70^$key))
convertToBinary
;;
G)tmp=$((71^$key))
convertToBinary
;;
H)tmp=$((72^$key))
convertToBinary
;;
I)tmp=$((73^$key))
convertToBinary
;;
J)tmp=$((74^$key))
convertToBinary
;;
K)tmp=$((75^$key))
convertToBinary
;;
L)tmp=$((76^$key))
convertToBinary
;;
M)tmp=$((77^$key))
convertToBinary
;;
N)tmp=$((78^$key))
convertToBinary
;;
O)tmp=$(( 79^$key))
convertToBinary
;;
P)tmp=$((80^$key))
convertToBinary
;;
Q)tmp=$((81^$key))
convertToBinary
;;
R)tmp=$((82^$key))
convertToBinary
;;
S)tmp=$((83^$key))
convertToBinary
;;
T)tmp=$((84^$key))
convertToBinary
;;
U)tmp=$((85^$key))
convertToBinary
;;
V)tmp=$((86^$key))
convertToBinary
;;
W)tmp=$((87^$key))
convertToBinary
;;
X)tmp=$((88^$key))
convertToBinary
;;
Y)tmp=$((89^$key))
convertToBinary
;;
Z)tmp=$((90^$key))
convertToBinary
;;
a)tmp=$((97^$key))
convertToBinary
;;
b)tmp=$((98^$key))
convertToBinary
;;
c)tmp=$((99^$key))
convertToBinary
;;
d)tmp=$((100^$key))
convertToBinary
;;
e)tmp=$((101^$key))
convertToBinary
;;
f)tmp=$((102^$key))
convertToBinary
;;
g)tmp=$((103^$key))
convertToBinary
;;
h)tmp=$((104^$key))
convertToBinary
;;
i)tmp=$((105^$key))
convertToBinary
;;
j)tmp=$((106^$key))
convertToBinary
;;
k)tmp=$((107^$key))
convertToBinary
;;
l)tmp=$((108^$key))
convertToBinary
;;
m)tmp=$((109^$key))
convertToBinary
;;
n)tmp=$((110^$key))
convertToBinary
;;
o)tmp=$((111^$key))
convertToBinary
;;
p)tmp=$((112^$key))
convertToBinary
;;
q)tmp=$((113^$key))
convertToBinary
;;
r)tmp=$((114^$key))
convertToBinary
;;
s)tmp=$((115^$key))
convertToBinary
;;
t)tmp=$((116^$key))
convertToBinary
;;
u)tmp=$((117^$key))
convertToBinary
;;
v)tmp=$((118^$key))
convertToBinary
;;
w)tmp=$((119^$key))
convertToBinary
;;
x)tmp=$((120^$key))
convertToBinary
;;
y)tmp=$((121^$key))
convertToBinary
;;
z)tmp=$((122^$key))
convertToBinary
;;
@)tmp=$((64^$key))
convertToBinary
;;
_)tmp=$((95^$key))
convertToBinary
;;
esac
done
echo "The Encrypted Text= "
for l in ${arrayOfXORs[@]}
do
firstPart=$(echo -n $l | cut -c1-4)
secondPart=$(echo -n $l | cut -c5-8)
echo -n $secondPart$firstPart " "
echo -n $secondPart$firstPart " " >> cipher.txt
done
x=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
binaryKey=${x[$key]}
firstPart=$(echo -n $binaryKey | cut -c1-4)
secondPart=$(echo -n $binaryKey | cut -c5-8)
echo $secondPart$firstPart
echo -n $secondPart$firstPart " " >> cipher.txt
printf "\n\nThe Encrypted text was saved in a file called cipher.txt"
arrayOfXORs=()
arrayOfMods=()
arrayOfChars=()
menu
################################# End of encryption
################################################
}
Decryption(){
cat /dev/null > decryptionOutput.txt
echo "Please insert the name of cipher.txt file:"
read file #reading the file name before entering if statement
checkIfFileExist
Lasteight=$(awk '{print $NF}' $file) # get the last eight bits of the file
firstPart=$(echo -n $Lasteight | cut -c1-4)
secondPart=$(echo -n $Lasteight | cut -c5-8)
allEight=$secondPart$firstPart
echo "The key in binary is: " $allEight
echo "The key in decimal is: " $((2#$allEight))
declare -a arrayOfSwaped
counter=0
for i in $(cat $file)
do
firstPart=$(echo -n $i | cut -c1-4)
secondPart=$(echo -n $i | cut -c5-8)
allEight=$secondPart$firstPart
arrayOfSwaped[$counter]=$allEight
((counter++))
done
printf "\n\nThe swaped cipher.txt is:\n"
echo ${arrayOfSwaped[@]}
counter=0
decimalKey=$((2#$allEight))
for j in ${arrayOfSwaped[@]}
do
decimalJ=$((2#$j))
arrayOfXORs[$counter]=$(($decimalJ^$decimalKey))
((counter++))
done
# echo "The XOR text is: " ${arrayOfXORs[@]}
for k in ${arrayOfXORs[@]}
do
case $k in
65) echo -n "A" >> decryptionOutput.txt;;
66) echo -n "B" >> decryptionOutput.txt;;
67) echo -n "C" >> decryptionOutput.txt;;
68) echo -n "D" >> decryptionOutput.txt;;
69) echo -n "E" >> decryptionOutput.txt;;
70) echo -n "F" >> decryptionOutput.txt;;
71) echo -n "G" >> decryptionOutput.txt;;
72) echo -n "H" >> decryptionOutput.txt;;
73) echo -n "I" >> decryptionOutput.txt;;
74) echo -n "J" >> decryptionOutput.txt;;
75) echo -n "K" >> decryptionOutput.txt;;
76) echo -n "L" >> decryptionOutput.txt;;
77) echo -n "M" >> decryptionOutput.txt;;
78) echo -n "N" >> decryptionOutput.txt;;
79) echo -n "O" >> decryptionOutput.txt;;
80) echo -n "P" >> decryptionOutput.txt;;
81) echo -n "Q" >> decryptionOutput.txt;;
82) echo -n "R" >> decryptionOutput.txt;;
83) echo -n "S" >> decryptionOutput.txt;;
84) echo -n "T" >> decryptionOutput.txt;;
85) echo -n "U" >> decryptionOutput.txt;;
86) echo -n "V" >> decryptionOutput.txt;;
87) echo -n "W" >> decryptionOutput.txt;;
88) echo -n "X" >> decryptionOutput.txt;;
89) echo -n "Y" >> decryptionOutput.txt;;
90) echo -n "Z" >> decryptionOutput.txt;;
97) echo -n "a" >> decryptionOutput.txt;;
98) echo -n "b" >> decryptionOutput.txt;;
99) echo -n "c" >> decryptionOutput.txt;;
100) echo -n "d" >> decryptionOutput.txt;;
101) echo -n "e" >> decryptionOutput.txt;;
102) echo -n "f" >> decryptionOutput.txt;;
103) echo -n "g" >> decryptionOutput.txt;;
104) echo -n "h" >> decryptionOutput.txt;;
105) echo -n "i" >> decryptionOutput.txt;;
106) echo -n "j" >> decryptionOutput.txt;;
107) echo -n "k" >> decryptionOutput.txt;;
108) echo -n "l" >> decryptionOutput.txt;;
109) echo -n "m" >> decryptionOutput.txt;;
110) echo -n "n" >> decryptionOutput.txt;;
111) echo -n "o" >> decryptionOutput.txt;;
112) echo -n "p" >> decryptionOutput.txt;;
113) echo -n "q" >> decryptionOutput.txt;;
114) echo -n "r" >> decryptionOutput.txt;;
115) echo -n "s" >> decryptionOutput.txt;;
116) echo -n "t" >> decryptionOutput.txt;;
117) echo -n "u" >> decryptionOutput.txt;;
118) echo -n "v" >> decryptionOutput.txt;;
119) echo -n "w" >> decryptionOutput.txt;;
120) echo -n "x" >> decryptionOutput.txt;;
121) echo -n "y" >> decryptionOutput.txt;;
122) echo -n "z" >> decryptionOutput.txt;;
95) echo -n " " >> decryptionOutput.txt;;
64) echo >> decryptionOutput.txt;;
esac
done
printf "\n\nThe Decrypted text was saved in a file called decryptionOutput.txt"
arrayOfXORs=()
arrayOfSwaped=()
menu
################################# End of decryption################################################
}
while true #while loop to keep reading the choice until the user enter E
do # beginning of while loop
read enteredletter # reading the entered choice to know what case to do
case $enteredletter in
E|e)Encryption;;
D|d)Decryption;;
X|x)exit 0;;
*)echo "Please Enter a valid choice from the menu only";;
esac # end of case statement
done