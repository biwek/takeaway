require_relative '../lib/takeaway'

# => +441988222016

describe Takeaway do 

	it "should list dishes" do 
		mishmash = Takeaway.new
		expect(mishmash.list_dishes).to eq(["pasta", "dumplings", "burger"])
	end

	it "should contain dishes with its price" do 
		mishmash = Takeaway.new
		expect(mishmash.menu).to eq([{dish: "pasta", price: 7.00}, {dish: "dumplings", price: 4.00}, {dish: "burger", price: 5.00}])
	end

	it "take an order and return its total" do 
		mishmash = Takeaway.new
		mishmash.order("pasta", 3)
		expect(mishmash.total).to eq(21.0)
	end

	it "takes two dish order and return its total" do 
		mishmash = Takeaway.new
		mishmash.order("pasta", 3)
		mishmash.order("dumplings", 2)
		expect(mishmash.total).to eq(29.0)
	end



end