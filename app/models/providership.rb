class Providership < ActiveRecord::Base
	belongs_to :user
	belongs_to :provider, :class_name => "User"
	validates_uniqueness_of :user_id, :scope => :provider_id

end
