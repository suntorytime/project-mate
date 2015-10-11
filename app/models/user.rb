require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :mates

  def self.authenticate(email, supplied_password)
    user = User.find_by(email: email)
    if user && user.password == supplied_password
      return user
    else
      return nil
    end
  end

  # def password
  #   @password ||= Password.new(password_hash)
  # end

  def password
    BCrypt::Password.new(hashed_password)
  end

  def password=(plaintext_password)
    @password = Password.create(plaintext_password)
    self.hashed_password = @password ##attribute in db needs to be noted here
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect_to home_url
    end
  end

end
