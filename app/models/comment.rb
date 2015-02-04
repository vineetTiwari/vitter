class Comment < ActiveRecord::Base
  belongs_to :tweet
  validates :body, presence: true
end
