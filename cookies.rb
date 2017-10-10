# Cookie
class Cookie

  def initialize
    @time_baking = 0
  end

  def bake
    @time_baking += 1
  end

  def status
    if @time_baking < @baking_time
      "Your cookies are doughy"
    elsif @time_baking == @baking_time
      "Your cookies are ready"
    elsif @time_baking > @baking_time
      "Your cookies are burnt"
    end
  end

end

# Types of cookies
class ButterCookies < Cookie

  def initialize
    super
    @baking_time = 20
  end

end

class ChocCookies < Cookie

  def initialize
    super
    @baking_time = 30
  end

end

# Oven
class Oven
  attr_reader :content

  def initialize
    @content = []
    @temp = 0
  end

  # def up_to_temp
  #   @temp == 210
  # end

  def preheat(temp)
    @temp = temp
  end

  def put_into_oven(cookies)
    if @temp == 210   #up_to_temp
      @content << cookies
    else
      puts "oven is not hot enough yet"
    end
  end

  def bake_one_minute
    @content.each do |cookies|
       cookies.bake
     end
  end

  def remove_from_oven(cookies)
    @content.delete(cookies)
  end

end

oven = Oven.new
butter_cookies = ButterCookies.new
choc_cookies = ChocCookies.new

oven.preheat(210)
oven.put_into_oven(butter_cookies)
oven.put_into_oven(choc_cookies)
p oven.content
30.times{oven.bake_one_minute}
oven.remove_from_oven(butter_cookies)
oven.remove_from_oven(choc_cookies)
p butter_cookies.status
p choc_cookies.status
