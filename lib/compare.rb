class Compare
  @@final_list = []

  def self.compareAll
    College.all.each do |school|
      if (User.score.to_i >= school.average_act.to_i) && (User.max_payment.to_i >= school.tuition_cost.delete("$").delete(',').to_i) && (User.priv_or_pub == school.public_or_private) && (User.student_pop.to_i >= school.number_of_students.to_i)
        @@final_list << school.name
      end
    end
  end

  def self.compare_act
    #puts User.name.score.to_i
    #puts User.score.to_i
    College.all.each do |school|
      if User.score.to_i >= school.average_act.to_i
        @@final_list << school.name
      end
    end
  end

  def self.compare_price
    #puts User.max_payment.to_i
    College.all.each do |school|
      if User.max_payment.to_i >= school.tuition_cost.delete("$").delete(',').to_i
        @@final_list << school.name
      end
    end
  end

  def self.compare_preference
          #puts User.priv_or_pub
    College.all.each do |school|
      if User.priv_or_pub == school.public_or_private
        @@final_list << school.name
      end
    end
  end

  def self.compare_studentpop
          #puts User.student_pop.to_i
    College.all.each do |school|
      #puts school.number_of_students.delete(',').to_i
      if User.student_pop.to_i >= school.number_of_students.delete(',').to_i
        @@final_list << school.name
      end
    end
  end

  def self.display_matches
    if @@final_list.length == 0
      puts "YOUR REQUIREMENTS ARE TOO STRICT AND/OR YOU NEED A HIGHER ACT SCORE!"
    else
      puts " "
      puts "YOUR COLLEGE MATCHES (IN NO PARTICULAR ORDER) ARE:"
      #remove the duplicates and output list
      output = @@final_list.uniq
      j = 1
      output.each do |col|
        puts "#{j}. #{col}"
        j = j+1
      end


      dd_response = " "
      while dd_response != "N"
      puts "Do you want to learn more about a particular match? [Enter Y or N]"
      dd_response = gets.chomp
        if dd_response == 'Y'
          puts "Enter the number of the match you want to learn more about:"
          number_response = gets.chomp.to_i - 1
          if number_response >= 1 || number_response <= output.length - 1
            College.all.each do |college_name|
              if college_name.name == output[number_response]
                puts "  Name of School: #{college_name.name}"
                puts "  Average Act Score: #{college_name.average_act}"
                puts "  Average SAT Score: #{college_name.average_sat}"
                puts "  Acceptance Rate: #{college_name.acceptance_rate}"
                puts "  Public or Private: #{college_name.public_or_private}"
                puts "  Institution Level: #{college_name.level_of_institution}"
                puts "  Campus Setting: #{college_name.campus_setting}"
                puts "  Tuition Cost: #{college_name.tuition_cost}"
                puts "  Student Population: #{college_name.number_of_students}"
              end
            end
          end
         end
      end

      puts "Good luck with your applications #{User.name}!"
    end
  end

end
