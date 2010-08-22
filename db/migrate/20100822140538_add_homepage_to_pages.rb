class AddHomepageToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :homepage, :boolean, :default => false
    add_column :pages, :show_title, :boolean, :default => true
  end

  def self.down
    remove_column :pages, :homepage
    remove_column :pages, :show_title
  end
end
