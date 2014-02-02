require 'twilio-ruby'

class Takeaway

	ACCOUNT_SID = 'AC6f685ed5444a892d3e40a55831b21487'
	AUTH_TOKEN = '4c90945f99c135471866df1f7080bfef'

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
		raise "Oops, Sorry The Sum Is INCORRECT!" if sum.to_f != total
		send_text && @total = []
	end

	def total
		@total.inject(:+)
	end

	def send_text
		account_sid = ACCOUNT_SID
		auth_token = AUTH_TOKEN  
		 
		@client = Twilio::REST::Client.new account_sid, auth_token 

		@client.account.messages.create(
		  :from => '+441980322022',
		  :to => '+447540573347',
		  :body => 'Thank you! Your order was placed and will be delivered before ' + delivery_time
		)
	end

	def delivery_time
		t = Time.new
		t.localtime("+01:00").strftime("%H:%M")
	end

end
