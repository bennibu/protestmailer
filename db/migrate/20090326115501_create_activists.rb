class CreateActivists < ActiveRecord::Migration
  def self.up
    create_table :activists do |t|
      t.integer :sex, :limit => 1, :default => 0
      t.string :title
      t.string :forename
      t.string :surename
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :email
      t.string :job
      t.boolean :newsletter

      t.timestamp :created_at
    end
  end

  def self.down
    drop_table :activists
  end
end
