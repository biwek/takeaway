require 'twilio-ruby'

class Takeaway

	MENU = [{dish: "pasta", price: 7.00}, {dish: "dumplings", price: 4.00}, {dish: "burger", price: 5.00}]

	def initialize
		@total = []
	end

	def menu
		MENU
	end

	def list_dishes
		menu.map {|dish| dish[:dish]}
	end

	def calc_order(dishes, quantities)
		dishes.each.with_index do |d, i|
			@total << menu.select {|m| m[:dish] == d}.map {|p| p.fetch(:price)}.join.to_f * quantities[i].to_f
		end
		return total
	end

	def place_order(dishes, quantities, sum)
		calc_order(dishes, quantities)
		raise "Oops, Sorry The Sum Is NOT Correct!" if sum != total
		true
		# else send text to customer if sum == total ("Thank you! Your order was placed and will be delivered before (1 hour from now)")
	end

	def total
		@total.inject(:+)
	end


# put your own credentials here, get them at twilio.com
# account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
# auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# # set up a client to talk to the Twilio REST API
# client = Twilio::REST::Client.new account_sid, auth_token

# # send an sms
# client.account.sms.messages.create(
#   :from => '+14159341234',
#   :to => '+16105557069',
#   :body => 'Hey there!')



	#### Extra Stuff ####
	# def interactive_menu
	# 	loop do 
	# 		puts "Hey mate, here is the menu"
	# 		list_dishes.each {|dish| puts dish}
	# 		puts "press 0 to exit"
	# 		input = gets.chomp
	# 		if input == "0"
	# 			exit
	# 		end
	# 	end
	# end


end