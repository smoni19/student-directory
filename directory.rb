@student_list = []

def print_header
  puts "-----The students of my Makers cohort-----"
  puts "------------------------------------------"
end

def print_students_list(students)
	system "clear"
  puts "Choose how to display students"
  puts "1. All"
  puts "2. Choose"
  puts "3. Name less than 12 characters"
  puts "4. In a specific cohort"
  case gets.to_i
    when 1
  	  system("clear")
      students.each_with_index do |student, index|
          puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n   Age: #{student[:age]}\n   Height: #{student[:height]}\n   Location: #{student[:location]}\n   Hobbies: #{student[:hobbies]}\n\n"
          #puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n\n"
          #print_student_details(students)
        end
    when 2
  	  system("clear")
      puts "Please enter the letter of names you wish to display"
      first_letter = gets.chomp
      puts "Students whose name begins with: #{first_letter}"
      students.each_with_index do |student, index|
        if student[:name].start_with?(first_letter)
          puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n   Age: #{student[:age]}\n   Height: #{student[:height]}\n   Location: #{student[:location]}\n   Hobbies: #{student[:hobbies]}\n\n"
          #puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n\n"
        end
      end
    when 3
  	  system("clear")
      students.each_with_index do |student, index|
        if student[:name].length < 12
          puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n   Age: #{student[:age]}\n   Height: #{student[:height]}\n   Location: #{student[:location]}\n   Hobbies: #{student[:hobbies]}\n\n"
          #puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n\n"
        end
      end
    when 4
      system("clear")
      cohort = gets.chomp
      students.each_with_index.map do |student, index|
        if cohort == student[:cohort]
          puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n   Age: #{student[:age]}\n   Height: #{student[:height]}\n   Location: #{student[:location]}\n   Hobbies: #{student[:hobbies]}\n\n"
          #puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n\n"
        end
      end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students\n\n"
end

=begin
def print_student_details(students)
  #puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n   Age: #{student[:age]}\n   Height: #{student[:height]}\n   Location: #{student[:location]}\n   Hobbies: #{student[:hobbies]}\n\n"
  puts "#{index + 1}. #{student[:name]}\n   Cohort: #{student[:cohort]}\n\n"
end
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    puts "Please enter cohort, leave empty for current month"
    cohort = gets.chomp.capitalize()
    if cohort == ""
      cohort = Time.now.strftime("%B")
    end
    puts "Please enter height"
    height = gets.chomp
    puts "Please enter age"
    age = gets.chomp
    puts "Please enter location"
    location = gets.chomp
    puts "Please enter hobbies"
    hobbies = gets.chomp
    @student_list << {name: name, cohort: cohort, age: age, height: height, location: location, hobbies: hobbies}
    #@student_list << {name: name, cohort: cohort}
    if @student_list.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@student_list.count} students"
    end
    name = gets.chomp
  end
  @student_list
end

def save_students
  file = File.open("students.csv", "w")
  @student_list.each do |student|
    student_data = [student[:name], student[:cohort], student[:age], student[:height], student[:location], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.to_i)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list(@student_list)
  print_footer(@student_list)
end

def process(selection)
  case selection
    when 1
      input_students
    when 2
      show_students
    when 3
      save_students
    when 9
      exit
    else
      puts "Invalid input, try again"
  end
end

interactive_menu