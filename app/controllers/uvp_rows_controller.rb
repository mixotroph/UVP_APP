class UvpRowsController < ApplicationController
	before_action  :signed_in_user, only: [:create, :destroy]
		
	def new
		@micropost = Micropost.find(params[:micropost_id])
		@uvp_row = @micropost.uvp_rows.new
	end

	def create
		@micropost = Micropost.find(params[:uvp_row][:micropost_id])
		@uvp_row = @micropost.uvp_rows.new(uvp_row_params)
		@uvp_row.save
		redirect_to user_micropost_path(@micropost, params[:uvp_row][:micropost_id])
	end

	def index
		@uvp_rows = UvpRow.rank(:row_order).all
	end

	def update_inline_content

    	update_row_content params[:uvp][:uvp_id], 
      	params[:uvp][:column], params[:uvp][:data], params[:uvp][:cke_id]

    	# this is a post action, updates sent via ajax, 
    	# no view rendered!
    	render nothing: true 
  	end

  	def destroy
  		#micropost = Micropost.find(params[:mi])
  		@mp_id = UvpRow.find(params[:id]).micropost_id
    	UvpRow.find(params[:id]).destroy
    	redirect_to user_micropost_path(current_user,@mp_id)
  	end

	def update_row_order

		#@micropost = Micropost.find(micropost_params[:micropost_id])
		#@micropost.row_order_position = micropost_params[:row_order_position]
		#@micropost.save

		render nothing: true # this is a post action, updates sent via ajax, no view rendered
	end

		private

		def uvp_row_params
			params.require(:uvp_row).permit(:uvp_row_id, :uvp_row, :lactivity, :data, :column, :row_order_position)
    	end
end