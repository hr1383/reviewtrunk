class PagesController < ApplicationController
before_action :authenticate_user!

def index	
	if current_user == nil
		@site = Site.new 
	else	
		@site = Site.find_by_user_id(current_user.id)
		@site = Site.new if @site == nil
	end
end
	
def pay	
end

def payment
end

def thanks

end
end
