class CreateTweetActions < ActiveRecord::Migration[5.1]
  def change
    create_table :tweet_actions do |t|
      t.references :tweet, foreign_key: true
      t.integer :type
      t.text :message
      t.references :action_by, references: :users, default: nil
      t.timestamps
    end
  end
end
