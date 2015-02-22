 class Micropost < ActiveRecord::Base

	include RankedModel
	
	has_many :uvp_rows

	ranks :row_order
	
	belongs_to :user
	ranks :swimming_order,
		:with_same => :user_id

	#default_scope -> { order('row_order ASC') }
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true

end