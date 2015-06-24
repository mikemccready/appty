class User < ActiveRecord::Base

	has_many :appointments
	has_many :user,  :through => :appointments
	has_many :providerships
	has_many :providers, :through => :providerships
	has_many :inverse_providerships, :class_name => "Providership", :foreign_key => "provider_id"
	has_many :inverse_providers, :through => :inverse_providerships, :source => :user

	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :user_name, presence: true, length: {minimum: 2}
	validates :email, presence: true
	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }#, uniqueness: {case_sensitive: false}

	class << self
	  def from_omniauth(auth_hash)
	    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	   	user.user_name = auth_hash['info']['name']
      	user.email = auth_hash['info']['email']
      	user.phone_number = auth_hash['info']['phone']
		user.image_url = auth_hash['info']['image']
		user.url = auth_hash['info']['urls']['Google']
		user.token = auth_hash['credentials']['token']
		user.category = ""
		user.sign_ins = 1
      	user.save!
      	user
    end
  end
end
