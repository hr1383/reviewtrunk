module StripeTool

    def self.create_membership(email: email, stripe_token: stripe_token)
	    customer = Stripe::Customer.create(:email => email, :source => stripe_token)	  
		response = Stripe::Subscription.create(
			  :customer => customer.id,
			  :items => [{:plan => "test123", :quantity => "1"}]
			)
		puts response 
		response
  	end
end