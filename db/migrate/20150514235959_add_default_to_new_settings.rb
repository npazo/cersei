class AddDefaultToNewSettings < ActiveRecord::Migration
  def change
    change_column :settings, :new, :boolean, :default => true
  end
end
