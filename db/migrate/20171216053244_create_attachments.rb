class CreateAttachments < ActiveRecord::Migration[5.1]
  def self.up
    create_table :attachments do |t|
        t.column :filename, :string
        t.column :content_type, :string
        t.column :data, :binary
    end
  end

  def self.down
    drop_table :attachments
  end
end
