require 'json'

DATA_FILE = "track_fan_data.json"

def load_data
  if File.exist?(DATA_FILE)
    JSON.parse(File.read(DATA_FILE))
  else
    { "tracks" => [], "fans" => [] }
  end
end

def save_data(data)
  File.write(DATA_FILE, JSON.pretty_generate(data))
end

def add_track(data)
  print "Track title: "
  title = gets.chomp
  print "Genre: "
  genre = gets.chomp
  print "Length (in min): "
  length = gets.chomp

  data["tracks"] << { "title" => title, "genre" => genre, "length" => length }
  puts "🎶 Track added!"
end

def add_fan(data)
  print "Fan name: "
  name = gets.chomp
  print "Interaction (comment/like/share): "
  interaction = gets.chomp
  print "Engagement level (1-10): "
  level = gets.chomp.to_i

  data["fans"] << { "name" => name, "interaction" => interaction, "level" => level }
  puts "🫶 Fan interaction recorded!"
end

def view_data(data)
  puts "\n🎵 Tracks:"
  data["tracks"].each_with_index do |t, i|
    puts "#{i+1}. #{t["title"]} | #{t["genre"]} | #{t["length"]} min"
  end

  puts "\n🧑‍🤝‍🧑 Fans:"
  data["fans"].each_with_index do |f, i|
    puts "#{i+1}. #{f["name"]} | #{f["interaction"]} | Engagement: #{f["level"]}/10"
  end
end

def menu
  data = load_data

  loop do
    puts "\n📀 TRACK & FAN MANAGER"
    puts "1. Add Track"
    puts "2. Add Fan Interaction"
    puts "3. View All Data"
    puts "4. Exit"
    print "Choose: "
    choice = gets.chomp

    case choice
    when "1"
      add_track(data)
    when "2"
      add_fan(data)
    when "3"
      view_data(data)
    when "4"
      save_data(data)
      puts "📁 Data saved. Goodbye!"
      break
    else
      puts "❌ Invalid choice."
    end
  end
end

menu
