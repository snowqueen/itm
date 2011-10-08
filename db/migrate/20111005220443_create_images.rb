class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :binary_file_name
      t.string :binary_content_type
      t.integer :binary_file_size
      t.datetime :binary_updated_at
    end
  end
end
