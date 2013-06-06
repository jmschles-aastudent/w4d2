require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :token

  has_many :contacts
  has_many :favorites
  has_many :favorite_contacts, :through => :favorites, :source => :contact

  def password=(password)
  	self.password_digest = BCrypt::Password.create(password)
  end

  def verify_password(password)
  	BCrypt::Password.new(self.password_digest) == password
  end

  def reset_token!
  	self.token = SecureRandom::base64(32)
  	self.save!

  	self.token
  end
end
