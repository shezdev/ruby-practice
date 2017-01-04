# Aim is to learn all available methods for the ruby String class
# http://ruby-doc.org/core-2.3.3/String.html
# Useful resource is https://ruby-doc.org/core-2.3.3/Regexp.html

# cmd ? will comment a line out on a mac from anywhere on that line:)
=begin
A String object holds and manipulates an arbitrary sequence of bytes, typically
representing characters. String objects may be created using String::new or as literals.

Because of aliasing issues, users of strings should be aware of the methods that
modify the contents of a String object.

Typically, methods with names ending in “!” modify their receiver,
while those without a “!” return a new String.

However, there are exceptions, such as String#[]=.

=end

#1# try_convert
#---------------
# Tries to convert an object into a String. Returns converted string or
# nil if the object cannot be converted.

  # puts String.try_convert("str") #=> "str"
  # puts String.try_convert(5) #=>  " "

#2# str % arg (string percentage argument)
#-----------------------------------------
# Uses str as a format specification, then returns the result of it to arg
 # puts "%05d" % 123 #=>  "00123". Numeric literals starting with 0 e.g. 05d are OCTALS

#3# str * integer (string multiplied by integer)
#-----------------------------------------------
# Copy — Returns a new String containing integer copies of the receiver.
# integer must be greater than or equal to 0.
  # puts "Ho! " * 3   #=> "Ho! Ho! Ho! "
  # puts "Ho! " * 0   #=> " "
  # puts "Ho! " * -1   #=> Throws error - `*': negative argument (ArgumentError)

#4# str + other_str (string 'plus' other string)
#-----------------------------------------
# aka. Concatenation — Returns a new String containing other_str concatenated to str.
# self is referencing the calling object i.e. main - which is the object at the
# top level of Ruby.
  # puts "Hello from " + self.to_s   #=> "Hello from main"

#5# +str ('plus' string)
#-----------------------------------------
# If the string is frozen, then return duplicated mutable string.
# If the string is not frozen, then return the string itself.
# NB - An immutable object is an object whose state cannot be modified after it is created.
  # greeting = "Hello" # Here is my string
  # puts +greeting #=> "Hello"

#6# -str ('minus' string)
  #-----------------------------------------
  # If the string is frozen, then return the string itself.
  # If the string is not frozen, duplicate the string, freeze it and return it

#7# str << integer or object  (string shovel integer or object)
  #-----------------------------------------
# << means to append / concatenate the given object to str.
# If the object is a Integer, it is considered as a codepoint, and is converted
# to a character before concatenation.
  # a = "hello"
  # puts a << "world" #=> helloworld
  # print a << 5 #=> hello
  # puts a.concat(33) #=> hello!

#8# string <=> (string spaceship operator)
#-----------------------------------------
# Comparison — Returns -1, 0, +1 or nil depending on whether string is less than,
# equal to, or greater than other_string.
# nil is returned if the two values are incomparable.
# If the strings are of different lengths, and the strings are equal when compared
# up to the shortest length, then the longer string is considered greater than the shorter one.
# <=> is the basis for the methods <, <=, >, >=, and between?, included from module Comparable.
# The method String#== does not use Comparable#==.

#puts "abcdef" <=> "abcde"     #=> 1 because left is greater in length than the right
#puts "abcdef" <=> "abcdef"    #=> 0 because left and right are equal lengths
#puts "abcdef" <=> "abcdefg"   #=> -1 because left is less in length than the right
#puts "abcdef" <=> "ABCDEF"    #=> 1 = interesting as same amount of letters, just a diff in case.
#puts "abcdef" <=> 1           #=> nil = incomparable

#9# str == obj (string equals object?)
# Equality - returns true or false
# Returns whether str == obj, similar to Object#==.
# If obj is not an instance of String but responds to to_str, then the two strings
# are compared using case equality Object#===.
# Otherwise, returns similarly to #eql?, comparing length and content.
#word = ["a", "b", "c"]
#puts word[0] == "a"  #=> true

#10# str =~ obj (string equals tilda object?)
# Match — If obj is a Regexp, use it as a pattern to match against str,
# and returns the position the match starts, or nil if there is no match.
#Otherwise, invokes obj.=~, passing str as an argument. The default =~ in Object returns nil.
# Note: str =~ regexp is not the same as regexp =~ str.
# Strings captured from named capture groups are assigned to local variables only in the second case.
# Note: \d/ is a digit character ([0-9]) - see https://ruby-doc.org/core-2.3.3/Regexp.html
# Good way to check if something has a number in it.
# "cat o' 9 tails" =~ /\d/   #=> 7 - because the number (9) starts at position 7.
# "cat o' 9 tails" =~ 9      #=> nil - because 9 is a number not a string

#11# Element Reference:

#str[index] returns new_str or nil
# If passed a single index, returns a substring of one character at that index.
#str = "Hello Friday!"
#puts str[0] #-> "H"

#str[start, length] #returns new_str or nil
# If passed a start index and a length, returns a substring containing length characters starting at the start index
#str = "Hello Friday!"
#puts str[0,7]  #-> "Hello F"

#str[range] #returns new_str or nil
# If passed a range, its beginning and end are interpreted as offsets delimiting the substring to be returned.
#str = "Hello Friday!"
#puts str[1..8] #-> "ello Fri"

#in these three cases above, if an index is negative, it is counted from the end of the string.

#str[regexp] #returns new_str or nil
#str = "Hello Friday!"
# When a a Regexp is supplied, the matching portion of the string is returned.
#puts str[/[aeiou](.)\1/]      #=> "ell"

#str[regexp, capture] #returns new_str or nil
#str = "Hello Friday!"
#str[/[aeiou](.)\1/, 0]   #=> "ell"
#str[/[aeiou](.)\1/, 1]   #=> "l"
#str[/[aeiou](.)\1/, 2]   #=> nil

#str[match_str] #returns new_str or nil
#str = "Hello Friday!"
#puts str["lo"]                #=> "lo"
#puts str["bye"]               #=> nil
# If a match_str is given, that string is returned if it occurs in the string.

#12# .bytesize → integer
# Returns the length of str in bytes.
#puts "hello".bytesize       #=> 5
#puts "Shereen".bytesize     #=> 7

#13# .byteslice  → new_str or nil
#puts "hello".byteslice(1)     #=> "e" - because e is at elem pos 1
#puts "hello".byteslice(-1)    #=> "o"
#puts "hello".byteslice(1, 2)  #=> "el"
#puts "\x80\u3042".byteslice(1, 3) #=> "\u3042" ?
#puts "\x03\u3042\xff".byteslice(1..3) #=> "\u3042" ?

#14# .capitalize → new_str
# Returns a copy of str with the first character converted to uppercase
# and the remainder to lowercase. Note: case conversion is effective only in ASCII region.
#puts "hello".capitalize    #=> "Hello" # 1st char only capitalised
#puts "HELLO".capitalize    #=> "Hello"
#"123ABC".capitalize   #=> "123abc"

#15# .capitalize!  → str or nil
#str = "hello"
#puts str.capitalize!   #=> "Hello"
#puts str               #=> "Hello"
#puts str.capitalize!   #=> nil

#18# casecmp(other_str) → -1, 0, +1 or nil ?
# Case-insensitive version of String#<=>.

#"abcdef".casecmp("abcde")     #=> 1
#"aBcDeF".casecmp("abcdef")    #=> 0
#"abcdef".casecmp("abcdefg")   #=> -1
#"abcdef".casecmp("ABCDEF")    #=> 0


#17# .center(width, padstr='')
#puts "hello".center(4)         #=> "hello"
#puts "hello".center(20)        #=> "       hello        "
#puts "hello".center(20, '123') #=> "1231231hello12312312"
#puts "hello".center(20, '*') #=> "*******hello********"

#18# chars → an_array ?
#Returns an array of characters in str. This is a shorthand for str.each_char.to_a.
#If a block is given, which is a deprecated form, works the same as each_char.

#19# chomp(separator=$/) → new_str
#Returns a new String with the given record separator removed from the end of str (if present). If $/ has not been changed from the default Ruby record separator, then chomp also removes carriage return characters (that is it will remove \n, \r, and \r\n). If $/ is an empty string, it will remove all trailing newlines from the string.

"hello".chomp                #=> "hello"
"hello\n".chomp              #=> "hello"
"hello\r\n".chomp            #=> "hello"
"hello\n\r".chomp            #=> "hello\n"
"hello\r".chomp              #=> "hello"
"hello \n there".chomp       #=> "hello \n there"
"hello".chomp("llo")         #=> "he"
"hello\r\n\r\n".chomp('')    #=> "hello"
"hello\r\n\r\r\n".chomp('')  #=> "hello\r\n\r"

# 20 # chomp!(separator=$/) → str or nil
# Modifies str in place as described for String#chomp, returning str, or nil if no modifications were made.

#21# .chop → new_str
# Returns a new String with the last character removed. If the string ends with \r\n, both characters are removed. Applying chop to an empty string returns an empty string. String#chomp is often a safer alternative, as it leaves the string unchanged if it doesn’t end in a record separator.

"string\r\n".chop   #=> "string"
"string\n\r".chop   #=> "string\n"
"string\n".chop     #=> "string"
"string".chop       #=> "strin"
"x".chop.chop       #=> ""

# chop! → str or nil
# Processes str as for String#chop, returning str, or nil if str is the empty string. See also String#chomp!.

#22# .chr → string
#Returns a one-character string at the beginning of the string.
# returns the first letter or character of the string

# a = "Shereen"
# a.chr    #=> "s"

# 23# codepoints → an_array ?
#Returns an array of the Integer ordinals of the characters in str. This is a shorthand for str.each_codepoint.to_a.
# If a block is given, which is a deprecated form, works the same as each_codepoint.

# concat(integer) → str
# concat(obj) → str

# 24 - Append —Concatenates the given object to str. If the object is a Integer, it is considered as a codepoint, and is converted to a character before concatenation.

# a = "hello "
# a << "world"   #=> "hello world"
# a.concat(33)   #=> "hello world!"

# count([other_str]+) → fixnum ?

# crypt(salt_str) → new_str

# 25 .delete([other_str]+) → new_str
# Returns a copy of str with all characters in the intersection of its
# arguments deleted. Uses the same rules for building the set of characters
# as String#count.

puts "hello".delete "l","lo"        #=> "heo"
"hello".delete "lo"            #=> "he"
"hello".delete "aeiou", "^e"   #=> "hell"
"hello".delete "ej-m"          #=> "ho"

# delete!([other_str]+) → str or nil
# Performs a delete operation in place, returning str, or nil if str was not modified.

# 26 # .downcase → new_str
# Returns a copy of str with all uppercase letters replaced with their lowercase counterparts. The operation is locale insensitive—only characters “A” to “Z” are affected. Note: case replacement is effective only in ASCII region.

"hEllO".downcase   #=> "hello"

# 26. empty? → true or false
# Returns true if str has a length of zero.

"hello".empty?   #=> false

# 27. end_with?([suffixes]+) → true or false

# Returns true if str ends with one of the suffixes given.

"hello".end_with?("ello")               #=> true

# 28. eql?(other) → true or false
# Two strings are equal if they have the same length and content.

# 29 # .gsub
# gsub(pattern, replacement) → new_str
# gsub(pattern, hash) → new_str
# gsub(pattern) {|match| block } → new_str
# gsub(pattern) → enumerator

"hello".gsub(/[aeiou]/, '*')                  #=> "h*ll*"
"hello".gsub(/([aeiou])/, '<\1>')             #=> "h<e>ll<o>"
"hello".gsub(/./) {|s| s.ord.to_s + ' '}      #=> "104 101 108 108 111 "
"hello".gsub(/(?<foo>[aeiou])/, '{\k<foo>}')  #=> "h{e}ll{o}"
'hello'.gsub(/[eo]/, 'e' => 3, 'o' => '*')    #=> "h3ll*"

# .include? other_str → true or false
# Returns true if str contains the given string or character.

"hello".include? "lo"   #=> true
"hello".include? "ol"   #=> false
"hello".include? ?h     #=> true

# .replace(other_str) → str click to toggle source

# Replaces the contents and taintedness of str with the corresponding values in other_str.

s = "hello"         #=> "hello"
s.replace "world"   #=> "world"

# inspect → string

# Returns a printable version of str, surrounded by quote marks, with special characters escaped.

str = "hello"
str[3] = "\b"
str.inspect       #=> "\"hel\\bo\""

# lstrip → new_str

# Returns a copy of str with leading whitespace removed. See also String#rstrip and String#strip.

# Refer to strip for the definition of whitespace.

"  hello  ".lstrip   #=> "hello  "
"hello".lstrip       #=> "hello"

# rstrip → new_str
# Returns a copy of str with trailing whitespace removed. See also String#lstrip and String#strip.

# Refer to strip for the definition of whitespace.

"  hello  ".rstrip   #=> "  hello"
"hello".rstrip       #=> "hello"



# match(pattern) → matchdata or nil
# match(pattern, pos) → matchdata or nil

# Converts pattern to a Regexp (if it isn’t already one), then invokes its match method on str. If the second parameter is present, it specifies the position in the string to begin the search.

'hello'.match('(.)\1')      #=> #<MatchData "ll" 1:"l">
'hello'.match('(.)\1')[0]   #=> "ll"
'hello'.match(/(.)\1/)[0]   #=> "ll"
'hello'.match('xx')         #=> nil

# next → new_str

# Returns the successor to str. The successor is calculated by incrementing characters starting from the rightmost alphanumeric (or the rightmost character if there are no alphanumerics) in the string. Incrementing a digit always results in another digit, and incrementing a letter results in another letter of the same case. Incrementing nonalphanumerics uses the underlying character set’s collating sequence.

# If the increment generates a “carry,” the character to the left of it is incremented. This process repeats until there is no carry, adding an additional character if necessary.

"abcd".succ        #=> "abce"
"THX1138".succ     #=> "THX1139"
"<<koala>>".succ   #=> "<<koalb>>"
"1999zzz".succ     #=> "2000aaa"
"ZZZ9999".succ     #=> "AAAA0000"
"***".succ         #=> "**+"

# replace(other_str) → str

# Replaces the contents and taintedness of str with the corresponding values in other_str.

s = "hello"         #=> "hello"
s.replace "world"   #=> "world"

# split(pattern=nil, [limit]) → anArray

# Divides str into substrings based on a delimiter, returning an array of these substrings.

" now's  the time".split        #=> ["now's", "the", "time"]
" now's  the time".split(' ')   #=> ["now's", "the", "time"]
" now's  the time".split(/ /)   #=> ["", "now's", "", "the", "time"]
"1, 2.34,56, 7".split(%r{,\s*}) #=> ["1", "2.34", "56", "7"]
"hello".split(//)               #=> ["h", "e", "l", "l", "o"]
"hello".split(//, 3)            #=> ["h", "e", "llo"]
"hi mom".split(%r{\s*})         #=> ["h", "i", "m", "o", "m"]

"mellow yellow".split("ello")   #=> ["m", "w y", "w"]
"1,2,,3,4,,".split(',')         #=> ["1", "2", "", "3", "4"]
"1,2,,3,4,,".split(',', 4)      #=> ["1", "2", "", "3,4,,"]
"1,2,,3,4,,".split(',', -4)     #=> ["1", "2", "", "3", "4", "", ""]

"".split(',', -1)               #=> []
