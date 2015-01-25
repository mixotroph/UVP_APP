class MicropostsController < ApplicationController
	before_action  :signed_in_user, only: [:create, :destroy]
	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "micropost created!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def index
		@microposts = Micropost.rank(:row_order).all
	end

	def update_row_order

		@micropost = Micropost.find(micropost_params[:micropost_id])
		@micropost.row_order_position = micropost_params[:row_order_position]
		@micropost.save

		render nothing: true # this is a post action, updates sent via ajax, no view rendered
	end

		private

		def micropost_params
			params.require(:micropost).permit(:micropost_id, :content, :row_order_position)
    	end
end