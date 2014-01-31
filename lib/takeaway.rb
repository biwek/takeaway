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

	def order(dish, quantity)
		@total << (menu.select {|m| m[:dish] == dish}.map {|d| d.fetch(:price)}.join.to_f) * quantity
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