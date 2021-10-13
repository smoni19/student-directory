@student_list = []

def print_header
  puts "-----The students of my Makers cohort-----"
  puts "------------------------------------------"
end

def print(students)
	system "clear"
  puts "Choose how to display students"
  puts "1. All"
  puts "2. Choose"
  puts "3. Name less than 12 characters"
  puts "4. In a specific cohort"
  case gets.to_i
    when 1
  	  system("clear")
      students.each_with_index do | student, index |
        puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n   Age: #{student[:age]}\n   Height: #{student[:height]}\n   Location: #{student[:location]}\n   Hobbies: #{student[:hobbies]}"
        end
    when 2
  	  system("clear")
      puts "Please enter the letter of names you wish to display"
      first_letter = gets.chomp
      puts "Students whose name begins with: #{first_letter}"
      students.each_with_index do | student, index |
        if student[:name].start_with?(first_letter)
          puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n   Age: #{student[:age]}\n   Height: #{student[:height]}\n   Location: #{student[:location]}\n   Hobbies: #{student[:hobbies]}"
        end
      end
    when 3
  	  system("clear")
      students.each_with_index do | student, index |
        if student[:name].length < 12
          puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n   Age: #{student[:age]}\n   Height: #{student[:height]}\n   Location: #{student[:location]}\n   Hobbies: #{student[:hobbies]}"
        end
      end
    when 4
      system("clear")
      cohort = gets.chomp
      students.each_with_index.map do | student, index |
        if cohort == student[:cohort]
          puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n   Age: #{student[:age]}\n   Height: #{student[:height]}\n   Location: #{student[:location]}\n   Hobbies: #{student[:hobbies]}"
        end
      end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
	system "clear"
  puts "Please enter the name, age, height, location & hobbies of the students"
  puts "To finish, just hit return twice"
  name = gets.strip
  puts "Please enter cohort, leave empty for current month"
  cohort = gets.chomp.capitalize()
  if cohort == ""
    cohort = Time.now.strftime("%B")
  end
=begin
  puts "Please enter height"
  height = gets.chomp
  puts "Please enter age"
  age = gets.chomp
  puts "Please enter location"
  location = gets.chomp
  puts "Please enter hobbies"
  hobbies = gets.chomp
  @student_list << {name: name, cohort: cohort, age: age, height: height, location: location, hobbies: hobbies}
=end
  @student_list << {name: name, cohort: cohort}
  if @student_list.length == 1
    puts "Now we have 1 student"
  else
    puts "Now we have #{@student_list.length} students"
  end
  
	#system "clear"
	
	puts "Do you wish to enter another student?"
	puts "1. Yes"
	puts "2. No"
	if gets.to_i == 1
	    input_students
	end
  @student_list
end

students = input_students
print_header
print(students)
print_footer(students)