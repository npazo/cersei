class AddNewAndMakeUniqueToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :new, :boolean
    add_index :settings, :name, :unique => true

  end
end
