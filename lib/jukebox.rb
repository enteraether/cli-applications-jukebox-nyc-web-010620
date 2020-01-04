# Add your code here
require 'pry'
def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  songs.each_with_index do |song, index|
    puts "#{index+1}. #{song}"
  end
end

def play(songs)
  puts "Please enter a song name or number:"
  user_resp = gets.strip
  # binding.pry
  if songs.include?(user_resp)
    found_song = songs.find {|song| song == user_resp}
    puts "Playing #{found_song}"
    # binding.pry
  elsif (1..songs.count).include?(user_resp.to_i)
    puts "Playing #{songs[user_resp.to_i - 1]}"
  else
      puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  while true do
    puts "Please enter a command:"
    response = gets.chomp
    case response.downcase
    when "exit"
      exit_jukebox
      break
    when "play"
      play(songs)
    when "help"
      help
    when "list"
      list(songs)
    else
      puts "Invalid entry"
    end
  end
end
