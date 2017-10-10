def pig_latin(word)
	firstLetter = word[0]
		if firstLetter.start_with?("a","e","i","o","u")
  		word = word + "way"
		else
      #word.slice(0)
  		word = word.slice(1..-1) + firstLetter + "ay"
		end
	word
end

piglatined = ARGV.map do |word|
  pig_latin(word)
end

puts piglatined.join(" ")

# def pig_latin(input)
#   case (first_char = input[0,1])
#   when /aeiou/i
#     input[1..-1] + first_char + "way"
#   else
#     input[1..-1] + first_char + "ay"
#   end
# end
#
# # Transform the input arguments into their Pig Latin equivalents
# # and combine into a single string by joining with spaces.

# piglatined = ARGV.map do |arg|
#   pig_latin(arg)
# end.join(' ')
#
# puts piglatined
