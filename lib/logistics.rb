def loading(page_num)
  icons = ['◐','◓','◑','◒']
  percent = "#{((page_num / 9.0) * 100).round(0)}%"

  icons.each do |icon|
    print "              ------#{icon} Loading #{percent} #{icon}------ \r"
    sleep 0.25
  end
end

def complete
  system 'clear'
  print "                               100% Complete"
  sleep 1
end

def prompt
  system 'clear'
  puts "                Which character would you like to learn about?"
end

def fav_char
  gets.chomp.downcase
end

def insult
  system 'clear'
  puts "\n              Oh please, have you ever seen star wars? \n\n"
end

def know_more
  puts "\n\nWould you like to no more?"
  gets.chomp
end

def show_character_info(characters, fav_char)
  characters.each do |character|
    if character.name.downcase == fav_char
      puts_attributes(character)
      sleep 4
      return
    end
  end
  raise error
end

def run_user_interaction(characters)
  loop do
    begin
      prompt
      show_character_info(characters, fav_char)
    rescue
      insult
      sleep 2
      retry
    end
    break if /^no/ === know_more 
  end
end

def puts_attributes(character)
  puts "\n*** #{character.name} ***"
  puts "The man, the myth, the legend: \n\n"
  puts "Height: #{character.height}"
  puts "Mass: #{character.mass}"
  puts "Hair Color: #{character.hair_color}"
  puts "Skin Color: #{character.skin_color}"
  puts "Eye Color: #{character.eye_color}"
  puts "Date of birth: #{character.birth_year}"
  puts "Gender: #{character.gender}"
end

def print_logo
  puts "           ________________.  ___     .______ "
  puts "          /                | /   \\    |   _  \\"
  puts "         |   (-----|  |----`/  ^  \\   |  |_)  |"
  puts "          \\   \\    |  |    /  /_\\  \\  |      /"
  puts "     .-----)   |   |  |   /  _____  \\ |  |\\  \\-------."
  puts "     |________/    |__|  /__/     \\__\\| _| `.________|"
  puts "      ____    __    ____  ___     .______    ________."
  puts "      \\   \\  /  \\  /   / /   \\    |   _  \\  /        |"
  puts "       \\   \\/    \\/   / /  ^  \\   |  |_)  ||   (-----`"
  puts "        \\            / /  /_\\  \\  |      /  \\   \\"
  puts "         \\    /\\    / /  _____  \\ |  |\\  \\---)   |"
  puts "          \\__/  \\__/ /__/     \\__\\|__| `._______/"
  puts "\n\n"
end
