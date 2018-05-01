class SitesController < ApplicationController


def create
	site = Site.find_by_user_id(current_user.id)
	if site == nil
		Site.create(site_params).save
		flash[:success] = "Details have been saved!"
	else 
		flash[:success] = "Details have been saved!"
		site.update_attributes(params)	
	end	
	redirect_to pages_path
end

def pay
	
	stripe_response = StripeTool.create_membership(email: current_user.email, 
                                 stripe_token: params[:site][:stripe_token])
	site = Site.find_by_user_id(current_user.id)
	site.update_attributes(params.require(:site)
		.permit(:stripe_token)
		.merge(user_id: current_user.id))
	#fix multiple writes
	site.update(stripe_info: stripe_response)
	render :nothing => true, :status => 201
end

def update
	site = Site.find_by_id(params[:id])
	site.update_attributes(site_params)	
	if site.stripe_token.nil?
		redirect_to payment_path
	else 
		flash[:success] = "Records updated!"
		redirect_to pages_path
	end
end
	
def site_params
	params.require(:site).permit(:address, :business, :business_url,
		:widget1,:widget2,:widget3,:url1, :url2, :url3, :ratings).merge(user_id: current_user.id)
end
end
