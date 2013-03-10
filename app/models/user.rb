class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email
  validates_presence_of :email, :password
  validates_length_of :password, minimum: 6
  validates_confirmation_of :password
end
