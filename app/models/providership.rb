class Providership < ActiveRecord::Base
	belongs_to :user
	belongs_to :provider, :class_name => "User"
end
