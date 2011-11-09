class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message
      t.boolean :read, :default => false

      t.timestamps
    end
  end
end
