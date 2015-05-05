class CreatePostsMedia < ActiveRecord::Migration
  def change
    create_table :posts_media do |t|
      t.belongs_to :posts, index: true
      t.belongs_to :medium, index: true

      t.timestamps null: false
    end
  end
end
