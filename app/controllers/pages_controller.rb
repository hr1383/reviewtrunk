class PagesController < ApplicationController
before_action :authenticate_user!, :except => [:signup]

def index	
	if current_user == nil
		@site = Site.new 
	else	
		@site = Site.find_by_user_id(current_user.id)
		@site = Site.new if @site == nil
	end
end

def signup
	Signup.create(signup_params).save
	render :json => {"success": true}
end

def signup_params
	params.require(:signup).permit(:name, :email, :url)
end
end
