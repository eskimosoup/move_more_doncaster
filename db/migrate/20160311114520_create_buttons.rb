class CreateButtons < ActiveRecord::Migration
  def change
    create_table :buttons do |t|
      t.string :area, null: false
      t.string :link_text, null: false
      t.string :link_url, null: false
      t.boolean :display, default: true, null: true

      t.timestamps null: false
    end
    add_index :buttons, :area
  end
end
