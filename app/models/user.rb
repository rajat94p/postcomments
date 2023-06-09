class User < ApplicationRecord
	has_secure_password

	validates :email, presence: true, uniqueness: true
	validates :phone, presence: true, uniqueness: true
	validates :password, presence: true

	
	has_many :posts, dependent: :destroy
	has_many :comments

end
