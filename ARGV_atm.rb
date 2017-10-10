bank_balance = 0
value = ARGV

if value[0] == "add"
	bank_balance += value[1].to_i
elsif value[0] == "withdraw"
  bank_balance -= value[1].to_i
elsif value[0] == "check balance"
  p bank_balance
end

puts "Your account now has #{bank_balance} dollars"



# def deaf_aunty(response)
#
#   if response =="hi"
#     p "hi back"
#   elsif response == "love"
#     p "good morning"
#   else
#     p "i dont know what to do"
#   end
#
# end
#
# response_1 = ARGV[0]
# response_2 = ARGV[1]
# puts ARGV.inspect
# p ARGV.class
