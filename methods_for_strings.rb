# Aim is to learn all available methods for the ruby String class
# http://ruby-doc.org/core-2.3.3/String.html

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
"cat o' 9 tails" =~ /\d/   #=> 7 - because the number (9) starts at position 7.
"cat o' 9 tails" =~ 9      #=> nil - because 9 is a number not a string
