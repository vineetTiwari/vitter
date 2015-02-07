class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :is_up
      t.references :tweet, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :votes, :tweets
    add_foreign_key :votes, :users
  end
end
