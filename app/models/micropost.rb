class Micropost < ActiveRecord::Base

	include RankedModel
	ranks :row_order
	belongs_to :user

	#default_scope -> { order('row_order ASC') }
	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true

end
