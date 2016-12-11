# 1. Accessing Array of Hashes
#-----------------------------

# from: http://stackoverflow.com/questions/18984390/accessing-array-of-hashes

family = [
            [
              { "Homer" => 40, "Marge" => 36, "Lisa" => 3, "Maggie" => 4,
                "Abe" => 80, "Santa's Little Helper" => 6
              }
            ],
            [
              { "Fred" => 40, "Wilma" => 36, "Pebbles" => 6,
                "Barney" => 38, "Betty" => 35, "Bamm-Bamm" => 3
              }
            ]
         ]
=begin

puts "My family is #{family}" # Family is an array of an arrays of hashes

puts "family[0] gives me #{family[0]}" # i.e. the first array
puts "family[0][0]['Homer'] gives me #{family[0][0]["Homer"]}" # the value of homer

# How to see all the values (inside the hashes, inside the arrays, inside the array called family):

family.each do |a|   # this is an array of an arrays of hashes
  a.each do |h|      # this is an array of hashes
     h.each do |k,v| # this is a hash
       puts "#{k} => #{v}"
     end
  end
end
=end

# How to order by values in the hashes...
family.each do |a|   # this is an array of an arrays of hashes
  a.each do |h|      # this is an array of hashes
     h.each do |k,v| # this is the hash
      # Sorting from smallest to largest value
       #puts " Sorting by values in the array is: #{h.sort_by {|k, v| v} }"
       sorted = []
       sorted = h.sort_by {|k| k[v]}
       puts "sorted is #{sorted}"
     end
  end
end
