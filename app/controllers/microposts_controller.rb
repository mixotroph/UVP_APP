class MicropostsController < ApplicationController
	before_action  :signed_in_user, only: [:create, :destroy]

	def new
		@micropost = current_user.microposts.build 
	end
	
	def create
		@micropost = current_user.microposts.build(micropost_params)
		@uvp_row = current_user.microposts.build(micropost_params)
		# flash[:success] = "micropost created!"
		#redirect_to micropost_path
		redirect_to root_path
	end

	def index
		@microposts = Micropost.rank(:swimming_order).all
	end

	def show
		#@uvp_rows = UvpRow.rank(:rank_order).all 
		@micropost = Micropost.find(params[:id])
		@uvp_rows = @micropost.uvp_rows
	end


	def update_inline_content

    	update_row_content params[:uvp][:uvp_id], 
      	params[:uvp][:column], params[:uvp][:data], params[:uvp][:cke_id]

    	# this is a post action, updates sent via ajax, 
    	# no view rendered!
    	render nothing: true 
  	end

  	def destroy_uvp_row
  		@micropost = Micropost.find(params[:id])
    	@micropost.uvp_rowa.find(params[:ri]).destroy
    	redirect_to micropost_path
  	end

	def update_row_order

		@micropost = Micropost.find(micropost_params[:micropost_id])
		@micropost.row_order_position = micropost_params[:row_order_position]
		@micropost.save

		render nothing: true # this is a post action, updates sent via ajax, no view rendered
	end

		private

		def micropost_params
			params.require(:micropost).permit(:id, :micropost_id, :content, :row_order_position, :user_id)
    	end
end