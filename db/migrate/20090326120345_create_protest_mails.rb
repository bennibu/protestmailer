class CreateProtestMails < ActiveRecord::Migration
  def self.up
    create_table :protest_mails do |t|
      t.string :subject
      t.text :body
      t.references :activist
      t.string :token
      t.timestamp :send_at

      t.timestamps
    end
  end

  def self.down
    drop_table :protest_mails
  end
end
