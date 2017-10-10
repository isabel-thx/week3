module SuperPowers
  @country = ["USA", "Singapore", "Russia", "Taiwan"]

  def teleport
    puts "You are now in " + @country.sample
  end

end

class Animal
  attr_reader :warm_blooded, :vertabrate, :num_of_legs, :can_fly

  def initialize
    @warm_blooded = true
    @vertabrate = true
    @num_of_legs = 0
    @can_fly = false
  end

end

class Mammal < Animal
  attr_reader :num_of_legs

  def initialize
    super
    @num_of_legs = 2
  end

end

class Bat < Mammal
  attr_reader :can_fly

  def initialize
    super
    @can_fly = true
  end

end

class Primate < Mammal

  def initialize
    super
  end

end

class Chimpanzee < Primate
  include SuperPowers
  def initialize
    super
  end

end

class Amphibian < Animal
  attr_reader :warm_blooded, :num_of_legs

  def initialize
    super
    @warm_blooded = false
    @num_of_legs = 0
  end

end

class Frog < Amphibian
  attr_reader :num_of_legs

  def initialize
    super
    @num_of_legs = 4
  end

end

p chimpanzee = Chimpanzee.new
p chimpanzee.teleport
