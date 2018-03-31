class SitesController < ApplicationController


def create
	site = Site.find_by_user_id(current_user.id)
	if site == nil
		Site.create(site_params).save
		flash[:success] = "Details have been saved!"
	else 
		site.update_attributes(params)	
	end	
	redirect_to :back
end

def pay
	
	StripeTool.create_membership(email: params[:stripeEmail], 
                                   stripe_token: params[:stripeToken])
	site = Site.find_by_user_id(current_user.id)
	site.update_attributes(params.require(:site).permit(:stripe_token).merge(user_id: current_user.id))
	render :nothing => true, :status => 201
end

def update
	site = Site.find_by_id(params[:id])
	site.update_attributes(site_params)	
	redirect_to :back
end
	
def site_params
	params.require(:site).permit(:address, :business, :business_url,
		:widget1,:widget2,:widget3,:url1, :url2, :url3, :ratings).merge(user_id: current_user.id)
end
end
