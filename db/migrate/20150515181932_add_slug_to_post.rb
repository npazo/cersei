class AddSlugToPost < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string, null: false, default: ''
  end
end
