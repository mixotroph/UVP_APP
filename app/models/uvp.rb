class Uvp < ActiveRecord::Base
	validates :user_id, presence: true
	validates :title, presence: true, length: { minimum: 6 }
	belongs_to :user
end
