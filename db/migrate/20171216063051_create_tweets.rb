class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.text :tweet_message
      t.references :attachment, foreign_key: true
      t.integer :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
