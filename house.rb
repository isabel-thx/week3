class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(components = {})
    @address = components[:address]
    @square_feet = components[:square_feet]
    @num_bedrooms = components[:num_bedrooms] || 3
    @num_baths = components[:num_baths] || 2
    @cost = components[:cost] || 320_000
    @down_payment = components[:down_payment] || 0.20
    @sold = components[:sold]
    @has_tenants = components[:has_tenants] || false
  end

  def obscure_address
    @address.sub(/\A\d*/, '****')
  end

  def buy!(money, good_credit)
    @sold = true if money >= down_payment && good_credit
  end

  def down_payment
    cost * @down_payment
  end

  def to_s
    "#{obscure_address} : #{square_feet} sq. ft., #{num_bedrooms} bed, #{num_baths} bath. $#{cost}"
  end
end

p house = House.new(address: "22, Penang Street", square_feet: 2000)
p house.obscure_address
