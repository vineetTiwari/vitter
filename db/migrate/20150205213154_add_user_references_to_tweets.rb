class AddUserReferencesToTweets < ActiveRecord::Migration
  def change
    add_reference :tweets, :user, index: true
    add_foreign_key :tweets, :users
  end
end
