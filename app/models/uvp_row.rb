class UvpRow < ActiveRecord::Base

	include RankedModel
	ranks :row_order

	belongs_to :micropost
	ranks :uvp_order,
		:with_same => :micropost_id
end
