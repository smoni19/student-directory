def print_header
  puts "-----The students of my Makers cohort-----"
  puts "------------------------------------------"
end

def print(students)
  students.each do | student |
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  #!name.empty? = while the name is not empty
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  #returning the array. ruby doesn't need "return"
  students
end

students = input_students
print_header
print(students)
print_footer(students)