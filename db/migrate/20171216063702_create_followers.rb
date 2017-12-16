class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.references :user,references: :users
      t.references :followed_by,references: :users 

      t.timestamps
    end
  end('<img src="data:image/jpg;base64,%s">' % Base64.encode64(Attachment.find(tweet.attachment_id).data)).html_safe
end
