module StripeTool

    def self.create_membership(email: email, stripe_token: stripe_token)
        Stripe::Customer.create(
          email: email,
          source: stripe_token
        )
      end
  end