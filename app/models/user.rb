require 'bcrypt'
class User < ActiveRecord::Base
  has_many :tweets

  has_many :follow_relationships, :class_name => "Relationship", :foreign_key => "followed_id"
  has_many :followers, :through => :followed_relationships, :source => :following

  has_many :followed_relationships, :class_name => "Relationship", :foreign_key => "follower_id"
  has_many :followings, :through => :follow_relationships, :source => :follower

  validates :user_name, uniqueness: { :message => "Username already Exists"}
  validates :user_name, presence: {:message => "Need Username and Password to login/register"}


   # validates :password_hash, presence: true

   # {:message => "Need Username and Password to login/register"}



  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
