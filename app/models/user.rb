class User < ApplicationRecord
     has_many :qr_codes

     after_create :generate_qr
  
     has_one_attached :profile_pic
     # adds virtual attributes for authentication
     has_secure_password
     # validates email and username
     validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9._-]{3,16}\z/, message: 'Invalid username' }
     validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end
