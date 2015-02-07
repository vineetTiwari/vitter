class Tweet < ActiveRecord::Base
  self.per_page = 4
  
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  
  validates :body, presence: true, length: { maximum: 140 }

  has_many :votes, dependent: :destroy
  has_many :voted_users, through: :votes, source: :user
end
