require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :activation_token, :email, :password, :session_token

  before_validation :set_activated_default, :set_user_type_default
  before_save :check_user_type

  validates :email, :presence => true,
  									:uniqueness => true,
  									:email => true

  validates :password, :presence => true

  
  def password=(password)
  	self.password_digest = BCrypt::Password.create(password)
  end

  def verify_password(password)
  	BCrypt::Password.new(self.password_digest) == password
  end

  def set_activated_default
  	self.activated ||= false
  	true
  end

  def set_user_type_default
  	self.user_type ||= "peon"
  	true
  end

  def check_user_type
  	%w(peon admin).include? self.user_type
  end
end