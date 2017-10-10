# This is how you define your own custom exception classes
class NoOrangesError < StandardError
end

class OrangeTree              # file name HAS TO BE orange_tree.rb
  attr_accessor :age, :height, :oranges_on_tree

  def initialize
    @height = 1.3
    @age = 0
    @oranges_on_tree = []
  end

  def age!
    @age += 1
    @height += rand(2..10)
    rand(0..10).times do
      @oranges_on_tree << Orange.new
    end
    # if @age % 3 == 0
    #   @oranges_on_tree += 10
    # end
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    if @oranges_on_tree.count == 0
      false
    else
      true
    end
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!
    if @oranges_on_tree.count >= 1
      @oranges_on_tree.shift
    else
      raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?
    end
  end

  def dead?
    if @age == 10
      true
    end
  end

end

class Orange
  attr_accessor :diameter

  def initialize
    @diameter = rand(3..5)
  end

end

#######################################################################
## Driver code:

    tree = OrangeTree.new

    tree.age! until tree.any_oranges?

    puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

    until tree.dead?
      basket = []

      # It places the oranges in the basket
      while tree.any_oranges?
        basket << tree.pick_an_orange!
      end

      sum_of_diameter = 0
      basket.each do |x|
        sum_of_diameter += x.diameter
      end

      avg_diameter = sum_of_diameter / basket.count

      puts "Year #{tree.age} Report"
      puts "Tree height: #{tree.height} feet"
      puts "Harvest: #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
      puts ""

      # Age the tree another year
      tree.age!
    end

    puts "Alas, the tree, she is dead!"
