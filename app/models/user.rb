class User < ActiveRecord::Base
  attr_accessible :email, :password, :username

  has_many :contacts
  has_many :favorites
  has_many :favorite_contacts, :through => :favorites, :source => :contact
end
