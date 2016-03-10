class CreateHomePageItems < ActiveRecord::Migration
  def change
    create_table :home_page_items do |t|
      t.integer :position, null: true
      t.string :title, null: false
      t.text :content, null: false
      t.string :colour, null: false
      t.boolean :display, null: true, default: true

      t.timestamps null: false
    end
  end
end
