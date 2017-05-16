class CreatePostsTable < ActiveRecord::Migration[5.0]
  def change

      create_table :blogs do |t|
          t.string :title
          t.string :category
          t.text :content
        #   t.blob blob stands for binary large object.
      end

  end
end
