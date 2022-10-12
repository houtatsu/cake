class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      # add_column :items, :is_active, :boolean, default: true, null: false

      t.timestamps
    end
  end
end