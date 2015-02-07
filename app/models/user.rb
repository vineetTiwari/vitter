class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_uniqueness_of :email
  has_many :votes, dependent: :destroy
  has_many :voted_tweets, through: :votes, source: :tweet 
end
