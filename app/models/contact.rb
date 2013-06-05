class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone, :user, :user_id

  validates :name, :presence => true
  validates :email, :email => true
  validates :phone, :phone => true
  validates :user_id, :presence => true

  belongs_to :user

  has_many :favorites
  has_many :favoriters, :through => :favorites, :source => :user
end
