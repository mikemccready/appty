class User < ActiveRecord::Base

	attr_reader :password

	has_many :user,  :through => :appointments
	has_many :providerships
	has_many :providers, :through => :providerships
	has_many :inverse_providerships, :class_name => "Providership", :foreign_key => "provider_id"
	has_many :inverse_providers, :through => :inverse_providerships, :source => :user

	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	class << self
	  def from_omniauth(auth_hash)
	    	user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])

      		user.email = auth_hash['info']['email']


      		user.save!
      		user

      end
  	end
end
