students = [{:name=>:Adam, :cohort=>:January, :country_of_birth=>:UK, :language=>:English}, {:name=>:Aisha, :cohort=>:March, :country_of_birth=>:UK, :language=>:English}, {:name=>:Adi, :cohort=>:January, :country_of_birth=>:UK, :language=>:English}]

# 1. Sort students array by :cohort, and put the result in a new array called sorted
sorted_by_c = []
sorted_by_c = students.sort_by do |c|
  c[:cohort]
end
#puts sorted_by_c

##Result is:
# {:name=>:Adam, :cohort=>:January, :country_of_birth=>:UK, :language=>:English}
# {:name=>:Adi, :cohort=>:January, :country_of_birth=>:UK, :language=>:English}
# {:name=>:Aisha, :cohort=>:March, :country_of_birth=>:UK, :language=>:English}

# 2. Quick Loop to print the sorted_by_c array i.e. our students ordered by cohort
sorted_by_c.each do |item|
  puts "(#{item[:cohort]} cohort) - #{item[:name]} | #{item[:country_of_birth]} | #{item[:language]} "
end # of .each


=begin
  students.each do |hash|

  #  while name[:name]
  #puts "hash is #{hash}"
  #hash is {:name=>:Adam, :cohort=>:January, :country_of_birth=>:UK, :language=>:English}
  #hash is {:name=>:Aisha, :cohort=>:March, :country_of_birth=>:UK, :language=>:English}
  #hash is {:name=>:Adi, :cohort=>:January, :country_of_birth=>:UK, :language=>:English}

  #puts hash[:cohort] # prints the month
  puts hash[:cohort] == "January"

     if hash[:cohort] == "January"
        puts "#{hash[:name]} (#{hash[:cohort]} cohort)"
    #  else
      #  puts "Error"
     end
  #  end
  end

# ------------------
=end
