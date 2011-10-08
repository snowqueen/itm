class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :summary
      t.text :content
      t.boolean :published
      t.date :publish_date
      t.string :slug
      t.boolean :comments_allowed
      t.integer :author

      t.timestamps
    end
  end
end
