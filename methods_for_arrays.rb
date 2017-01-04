# https://ruby-doc.org/core-2.3.3/Array.html

# Arrays are ordered, integer-indexed collections of any object.

# Array indexing starts at 0, as in C or Java. A negative index is assumed to be relative to the end of the array---that is, an index of -1 indicates the last element of the array, -2 is the next to last element in the array, and so on.

# ----------Accessing Elements----------------#

# .first and .last
# The special methods first and last will return the first and last elements of an array, respectively.

arr = ['1', '2', '3', '4', '5', '6']
arr.first #=> 1
arr.last  #=> 6

# .take
#To return the first n elements of an array, use take

arr.take(3) #=> ['1', '2', '3']

# .drop
#.drop does the opposite of take, by returning the elements after n elements have been dropped:

arr.drop(3) #=> [4, 5, 6]

# -------Obtaining Information about an Array-------------#
# .length .count .size
# Arrays keep track of their own length at all times. To query an array about the number of elements it contains, use length, count or size.

browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
browsers.length #=> 5
browsers.count #=> 5

# To check whether an array contains any elements at all
# .empty
browsers.empty? #=> false

# To check whether a particular item is included in the array
# .include
browsers.include?('Konqueror') #=> false

# -------Adding items to Arrays-------------#
# Items can be added to the end of an array by using either .push or <<
arr = [1, 2, 3, 4]
arr.push(5) #=> [1, 2, 3, 4, 5]
arr << 6    #=> [1, 2, 3, 4, 5, 6]

# .unshift will add a new item to the START/beginning of an array.

arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6]

# .insert
# With insert you can add a new element to an array at any position.

arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]

# Using the insert method, you can also insert multiple values at once:

arr.insert(3, 'orange', 'pear', 'grapefruit')
#=> [0, 1, 2, "orange", "pear", "grapefruit", "apple", 3, 4, 5, 6]

# -------Removing items from an Array-------------#

# .pop - The method pop removes the last element in an array and returns it:

arr =  [1, 2, 3, 4, 5, 6]
arr.pop #=> 6
arr #=> [1, 2, 3, 4, 5]

# To retrieve and at the same time remove the first item, use shift:
# .shift
arr.shift #=> 1
arr #=> [2, 3, 4, 5]

# To delete an element at a particular index:
# .delete_at(n)
arr.delete_at(2) #=> 4
arr #=> [2, 3, 5]

# To delete a particular element anywhere in an array, use delete:

arr = [1, 2, 2, 3]
arr.delete(2) #=> 2
arr #=> [1,3]

# .compact
# A useful method if you need to remove nil values from an array is compact:

arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact! #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, 'bar', 7, 'baz']

# .uniq
# Another common need is to remove duplicate elements from an array. Use the non-destructive uniq, and destructive method uniq!

arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
arr.uniq #=> [2, 5, 6, 556, 8, 9, 0, 123]


# -------Iterating over an Array-------------#

# .each
# Defines what elements should be iterated over and how. In case of Array’s each, all elements in the Array instance are yielded to the supplied block in sequence. Note that this operation leaves the array unchanged.

arr = [1, 2, 3, 4, 5]
arr.each { |a| print a -= 10, " " }
# prints: -9 -8 -7 -6 -5
#=> [1, 2, 3, 4, 5]

# .reverse_each
# Another useful iterator which will iterate over the elements in the array in reverse order.

words = %w[first second third fourth fifth sixth]
str = ""
words.reverse_each { |word| str += "#{word} " }
p str #=> "sixth fifth fourth third second first "

# .map
# Can be used to create a NEW array based on the original array, but with the values modified by the supplied block:

arr.map { |a| 2*a }   #=> [2, 4, 6, 8, 10]
arr                   #=> [1, 2, 3, 4, 5]
arr.map! { |a| a**2 } #=> [1, 4, 9, 16, 25]
arr                   #=> [1, 4, 9, 16, 25]

# -------Selecting items from an Array-------------#
# Elements can be selected from an array according to criteria defined in a block. The selection can happen in a destructive or a non-destructive manner. While the DESTRUCTIVE operations will modify the array they were called on, the NON-DESTRUCTIVE methods usually return a new array with the selected elements, but leave the original array unchanged.

# .select, .reject, .drop_while
# These are non-destructive selection methods which return a new array with the selected elements, but leave the original array unchanged.

arr = [1, 2, 3, 4, 5, 6]
arr.select { |a| a > 3 }     #=> [4, 5, 6] # putting elements bigger than 3 into a new array
arr.reject { |a| a < 3 }     #=> [3, 4, 5, 6]
arr.drop_while { |a| a < 4 } #=> [4, 5, 6]
arr                          #=> [1, 2, 3, 4, 5, 6]

# .select! and .reject! are the corresponding destructive methods

# .delete_if, .keep_if
# These are destructive methods:

arr.delete_if { |a| a < 4 } #=> [4, 5, 6]
arr                         #=> [4, 5, 6]

arr = [1, 2, 3, 4, 5, 6]
arr.keep_if { |a| a < 4 } #=> [1, 2, 3]
arr                       #=> [1, 2, 3]
