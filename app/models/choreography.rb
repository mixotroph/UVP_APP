class Choreography < ActiveRecord::Base
	serialize :steps #, JSON 
end
