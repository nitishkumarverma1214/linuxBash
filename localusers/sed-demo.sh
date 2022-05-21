#!/bin/bash

# Sed - Stream Editor
#sed 's/search-pattern/replacement/flag'
#s- is for substitute

# Only perform substitution -don't change the original file.
sed 's/assistant/developer/' manager.txt
echo

# To perform case insensetive match
sed 's/MY wife/sed/i' love.txt
echo

# To match mutliple times - the second occurance on the same line will not change
sed 's/My wife/sed/i' love.txt
echo

# To match all the pattern in the file
sed 's/my wife/sed/ig' love.txt

echo
echo "replace second occurance"
# Replace only particular occurance
sed 's/my love/sed/i2' love.txt

# Save the changes in another file
sed 's/my wife/sed/ig' love.txt > love-updated.txt

# use -i for inplace change in same file and can also create backup of file
sed -i.bak 's/my wife/my love/ig' love.txt


#Only save the line where changes are made
sed 's/love/like/gw like.txt' love.txt

echo
# delete a match
sed '/^This/d' love.txt


#multiple match of pattern
echo
#^$ means blank line
sed '/^#/d; /^$/d' config

# alternate way to match multiple pattern
sed -e'/^#/d' -e '/^$/d' -e 's/apache/httpd/' config

#using .sed file 
sed -f script.sed config

# to change the seperator
echo
echo '/home/nitish' | sed 's/\/home\/nitish/\/home\/nk/'
echo
echo '/home/nitish' | sed 's#/home/nitish/#/home/nk#'

# using address
sed '2s/apache/httpd/' config
echo
sed '1,3 s/configuration/execute/' config
echo
# using regex as address 
sed '/Group/ s/apache/httpd/' config
echo
sed '/#User/,/^$/ s/confirguration/execute/' config

