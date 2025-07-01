puts "whats your name friend?"
name = gets.chomp

	puts "Hey #{name}! How are you feeling right now ...realtalk?"

	mood =gets.chomp.downcase
if mood.include?("good") || mood.include?("great") || mood.include?("fine")

	puts "Glad to hear that #{name},Make sure you keep it that way...youre killing it😎"
 elsif mood.include?("tired") || mood.include?("down") || mood.include?("sad") || mood.include?("bad")

	puts "sorry 😢 ,how about you take it easy get some rest and cheer up you deserve it🤗"
else 

	puts"Copy that 👌whatever it is youll be okay 🤗"
end
