class CreateAdditionalContents < ActiveRecord::Migration
  def change
    create_table :additional_contents do |t|
      t.string :area, null: false, unique: true
      t.string :title, null: true
      t.text :content, null: false
      t.boolean :display, default: true, null: true

      t.timestamps null: false
    end

    add_index :additional_contents, :area
  end
end
