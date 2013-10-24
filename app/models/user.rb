class User < ActiveRecord::Base

  attr_accessor :password
  
  before_save :encrypt_password
  before_save { |user| user.email.downcase! }
  after_save :clear_password
  
  validates :username, :presence => true, uniqueness: { case_sensitive: false }, :length => { :in => 3..20 }
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i # email structure to match
  validates :email, :presence => true, uniqueness: { case_sensitive: false }, :format => EMAIL_REGEX
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 2..20, :on => :create
  
  def self.authenticate(username_or_email="", login_password="")
    if  EMAIL_REGEX.match(username_or_email)    
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end
    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end
  
  
  def match_password(login_password="")
    require 'digest/sha1'
    encrypted_password == Digest::SHA1.hexdigest(self.salt+login_password)
  end
  
  def encrypt_password
    require 'digest/sha1'
    if password.present?
      self.salt = Digest::SHA1.hexdigest(self.email+Time.now.to_s)
      self.encrypted_password = Digest::SHA1.hexdigest(self.salt+password)
      puts "Hay contraseña"
    else
      puts "NO HAY contraseña"
    end
  end
  
  def clear_password
    self.password = nil
  end
  
end
