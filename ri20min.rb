#!/usr/bin/env ruby

class MegaGreeter
   attr_accessor :names # Easy way to provide access to an object's variables from outside the class

  # Create the object
  def initialize(names = "World")
    @names = names # @names is an instance variable, without the attr_accessor set above, it would only be available to the instance methods within the MegaGreeter class, and .respond_to? wouldn't work i.e. object_name.respond_to?("names") would retun "false" in irb
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..." # No point greeting nobody!

    elsif @names.respond_to?("each") # if the @names object responds to each, it's something that can be iterated over
      # If @names is a list of some kind, iterate!
      @names.each do |name| # each is a method that accepts a block of code then runs that block of code for every element in a list, and the bit between do and end is just such a block. A block is like an anonymous function or lambda. The variable between pipe characters is the parameter for this block.
        puts "Hello #{name}!" # What happens here is that for every entry in a list, name is bound to that list element, and then the expression puts "Hello #{name}!" is run with that name. Internally, the each method will essentially call yield "Albert", then yield "Brenda" and then yield "Charles", and so on.
      end # end of each

    else # if @names is anything else, just let it get turned into a string automatically and do the default greeting.
      puts "Hello #{@names}!"
    end # end of if-elsif-else block
  end # end of def say_hi


# Blocks, the Highly Sparkling Glint on the Edge of Ruby
# The real power of blocks is when dealing with things that are more complicated than lists. Beyond handling simple housekeeping details within the method, you can also handle setup, teardown, and errors—all hidden away from the cares of the user.

# The say_bye method doesn’t use each, instead it checks to see if @names responds to the join method, and if so, uses it. Otherwise, it just prints out the variable as a string. This method of not caring about the actual type of a variable, just relying on what methods it supports is known as “Duck Typing”, as in “if it walks like a duck and quacks like a duck…”. The benefit of this is that it doesn’t unnecessarily restrict the types of variables that are supported. If someone comes up with a new kind of list class, as long as it implements the join method with the same semantics as other lists, everything will work as planned.

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end
end

# Kicking Off the Script
# So, that’s the MegaGreeter class, the rest of the file just calls methods on that class.
# __FILE__ is the magic variable that contains the name of the current file. $0 is the name of the file used to start the program. This check says “If this is the main file being used…” This allows a file to be used as a library, and not to execute code in that context, but if the file is being used as an executable, then execute that code.

if __FILE__ == $0
  mg = MegaGreeter.new # Creating an instance called mg
  mg.say_hi # => Hello World!
  mg.say_bye # => Goodbye World.  Come back soon!

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi # => Hello Zeke!
  mg.say_bye # => Goodbye Zeke.  Come back soon!

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Charles",
              "Dave", "Engelbert"]
  mg.say_hi
  # => Hello Albert!
  # => Hello Brenda!
  # => Hello Charles!
  # => Hello Dave!
  # => Hello Engelbert!
  mg.say_bye # => Goodbye Albert, Brenda, Charles, Dave, Engelbert.  Come back soon!

  # Change to nil
  mg.names = nil
  mg.say_hi # => ...
  mg.say_bye # =>...
end
