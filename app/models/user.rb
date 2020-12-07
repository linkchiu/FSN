class User < ApplicationRecord
	
	before_save {self.email = email.downcase}
  	has_many :microposts, dependent: :destroy

  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email,presence: true, length: { maximum: 50 }, format:{with: VALID_EMAIL_REGEX}, uniqueness: true

  	validates :name, presence: true, length: { maximum: 255 }
  	validates :password_digest, presence: true, length: { minimum: 2 },allow_nil: true
  	has_secure_password

	def feed
		Micropost.where("user_id = ?", id)
	end

end
