class Tweet < ActiveRecord::Base
  self.per_page = 4
  has_many :comments, dependent: :destroy
  validates :body, presence: true, length: { maximum: 140 }
end
