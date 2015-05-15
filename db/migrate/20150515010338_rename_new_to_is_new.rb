class RenameNewToIsNew < ActiveRecord::Migration
  def change
    rename_column :settings, :new, :is_new
  end
end
