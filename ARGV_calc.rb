value = ARGV
if value[1] == "+"
  result = value[0].to_i + value[2].to_i
elsif value[1] == "-"
  result = value[0].to_i - value[2].to_i
elsif value[1] == "*"
  result = value[0].to_i * value[2].to_i
elsif value[1] == "/"
  result = value[0].to_i / value[2].to_i
end

p result
