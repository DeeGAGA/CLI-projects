#Age_wizard calculator by DeeGAGA
require 'date'

puts "🧙 Welcome to the Age Wizard v4.0: Intergalactic GAGA Edition!"
puts "Enter your full birthdate (YYYY-MM-DD):"
birth_input = gets.chomp
birth_date = Date.parse(birth_input)

today = Date.today
age_days = (today - birth_date).to_i
age_years = age_days / 365.25

# AGE BREAKDOWN
puts "\n📊 Accurate Age Breakdown:"
puts "Total Days Alive: #{age_days}"
puts "Approx Years: #{age_years.round(2)}"
puts "Approx Months: #{(age_years * 12).round(1)}"
puts "Approx Hours: #{(age_days * 24)}"
puts "Approx Minutes: #{(age_days * 24 * 60)}"
puts "Approx Seconds: #{(age_days * 24 * 60 * 60)}"

# ASK FOR BIRTHDAY
puts "\n🔮 Wanna know when your next birthday is? (yes/no)"
answer_birthday = gets.chomp.downcase
if answer_birthday == "yes"
  next_birthday = Date.new(today.year, birth_date.month, birth_date.day)
  next_birthday = next_birthday.next_year if next_birthday < today
  days_until = (next_birthday - today).to_i
  puts "\n🎂 Your next birthday is on #{next_birthday.strftime('%A, %B %d, %Y')}!"
  puts "That's in #{days_until} days 🎉"
end

# ASK FOR 100-YEAR TIME
puts "\n⏳ Wanna know how long till you're 100? (yes/no)"
answer_hundred = gets.chomp.downcase
if answer_hundred == "yes"
  age_100_year = birth_date.year + 100
  age_100_date = Date.new(age_100_year, birth_date.month, birth_date.day)
  days_to_100 = (age_100_date - today).to_i
  years_to_100 = (days_to_100 / 365.25).round(2)
  puts "\n🧓 You'll hit 100 on #{age_100_date.strftime('%A, %B %d, %Y')}!"
  puts "That's in about #{days_to_100} days (~#{years_to_100} years) 💯"
end

# ZODIAC SIGN
def zodiac_sign(month, day)
  signs = [
    ["Capricorn",  Date.new(2020, 12, 22), Date.new(2021, 1, 19)],
    ["Aquarius",   Date.new(2020, 1, 20),  Date.new(2020, 2, 18)],
    ["Pisces",     Date.new(2020, 2, 19),  Date.new(2020, 3, 20)],
    ["Aries",      Date.new(2020, 3, 21),  Date.new(2020, 4, 19)],
    ["Taurus",     Date.new(2020, 4, 20),  Date.new(2020, 5, 20)],
    ["Gemini",     Date.new(2020, 5, 21),  Date.new(2020, 6, 20)],
    ["Cancer",     Date.new(2020, 6, 21),  Date.new(2020, 7, 22)],
    ["Leo",        Date.new(2020, 7, 23),  Date.new(2020, 8, 22)],
    ["Virgo",      Date.new(2020, 8, 23),  Date.new(2020, 9, 22)],
    ["Libra",      Date.new(2020, 9, 23),  Date.new(2020, 10, 22)],
    ["Scorpio",    Date.new(2020, 10, 23), Date.new(2020, 11, 21)],
    ["Sagittarius",Date.new(2020, 11, 22), Date.new(2020, 12, 21)],
  ]

  birthday = Date.new(2020, month, day)
  signs.each do |sign, start_date, end_date|
    return sign if (start_date..end_date).cover?(birthday)
  end

  "Capricorn" # fallback
end


zodiac = zodiac_sign(birth_date.month, birth_date.day)
puts "\n🌌 Your Zodiac sign is: #{zodiac} ✨"

# AGE ON OTHER PLANETS (years are different lengths!)
planet_years = {
  "Mercury" => 0.24,
  "Venus"   => 0.62,
  "Mars"    => 1.88,
  "Jupiter" => 11.86,
  "Saturn"  => 29.46
}

puts "\n🪐 Your age on other planets:"
planet_years.each do |planet, ratio|
  planet_age = (age_years / ratio).round(2)
  puts "#{planet}: #{planet_age} years"
end

# GAGA FORTUNE JOKE
puts "\n😼 Wanna know how much money you’ll make before you turn 100? (yes/no)"
fortune = gets.chomp.downcase
if fortune == "yes"
  puts "\n💸 How do you even expect me to know that?"
  puts "I'm just a man... I'm DeeGAGA 😼😼"
  puts "I can't do that... **yet**."
end

