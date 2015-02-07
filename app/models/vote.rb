class Vote < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user

  validates :tweet_id, uniqueness: {scope: :user_id}
end
