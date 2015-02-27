require 'bcrypt'
class User < ActiveRecord::Base
  has_many :follow_relationships, :class_name => "Relationship", :foreign_key => "followed_id"
  has_many :followers, :through => :follow_relationships, :source => :following

  has_many :followed_relationships, :class_name => "Relationship", :foreign_key => "follower_id"
  has_many :followings, :through => :followed_relationships, :source => :follower

  has_many :tweets

  validates :user_name, {
    uniqueness: {:message => "user name already exists"},
    presence: {:message => "you must give a username"}
  }
  validates :full_name, presence: {:message => "you must give your full name"}
  validates :email, {
    presence: {:message => "you must give your email "},
    uniqueness: {:message => "email already exists"}
  }
  validates :password_hash, {
    presence: {:message => "you must give a pasword "},
    length: {minimum: 8
      # :message => "pasword must have 8 or more characters"
    }
  }
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
