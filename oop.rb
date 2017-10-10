#PetGrowth
module FeedIncreaseRate

  def increase_feed

  end

end

#Animals
class FurryAnimals
  include FeedIncreaseRate
  attr_reader :fur

  def initialize(weight)
    @age = 0
    @fur = Fur.new
    @weight = weight
    @feed = 1
  end

  def communicate
    "I can communicate to my human"
  end

  def feed
  	@feed += 1
  end

  def grow!
    @age += 1
    @weight += rand(2..5)
    puts "my pet is #{@age} years old and weighs #{@weight}kgs!"
  end

  def fur_grow_longer                 # Must define fur_grow_longer in FurryAnimals
    @fur.fur_grow_longer              # so as to be able to call it from Fur
  end

  # def dead?
  #   if @age == 10
  #     true
  #   end
  # end

end

#FurGrowth
class Fur
  attr_reader :length

  def initialize
    @length = rand(1..3)
  end

  def fur_grow_longer
    @length += rand(1..3)
    puts "my pet's fur is now #{@length}cm long"
  end

end

#Dog
class Dog < FurryAnimals

  def initialize
    super(9)                          #Takes all functions from method of ParentClass
  end

  def communicate
  	super + " by barking"
  end

end

#Rabbit
class Rabbit < FurryAnimals

  def initialize
    super(5)
  end

  def communicate
	  super + " by biting on her ankle"
  end

end

# furry_animals = FurryAnimals.new(0)

pets = []
pets << Dog.new
pets << Rabbit.new
# until pets.dead?
  pets.each do |pet|
    p pet
    p pet.communicate
    pet.grow!
    p pet.fur_grow_longer
  end
  # pet.grow!
# end
