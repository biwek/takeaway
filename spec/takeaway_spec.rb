require_relative '../lib/takeaway'

describe Takeaway do 
			
	let(:yallayalla) { Takeaway.new }
	
	context "Menu:" do 
		it "should list dishes" do 
			expect(yallayalla.list_dishes).to eq(["pasta", "dumplings", "burger"])
		end

		it "should contain dishes with its price" do 
			expect(yallayalla.menu).to eq([{dish: "pasta", price: 7.00}, {dish: "dumplings", price: 4.00}, {dish: "burger", price: 5.00}])
		end
	end

	context "Calculate Order:" do 

		it "calculates an order with a single dish" do 
			expect(yallayalla.calc_order(["pasta"], [3])).to eq(21.0)
		end

		it "calculates an order with two dish" do 
			expect(yallayalla.calc_order(["pasta", "dumplings"], [3, 2])).to eq(29.0)
		end
	end

	context "Placing Order:" do

		it "takes an order with a list of single dish" do 
			yallayalla.stub(:send_text).and_return(true)
			expect(yallayalla.place_order(["pasta"], [3], 21.0)).to be_true
		end

		it "takes an order with a list of two dish" do 
			yallayalla.stub(:send_text).and_return(true)
			expect(yallayalla.place_order(["pasta", "burger"], [2, 4], 34.0)).to be_true
		end

		it "raises an error if total is not correct" do 
			expect{yallayalla.place_order(["pasta", "burger"], [2, 4], 30.0)}.to raise_error("Oops, Sorry The Sum Is INCORRECT!")
		end

	end

end