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
