class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :page_location
      t.text :h1_data
      t.text :h2_data
      t.text :h3_data
      t.text :links_data

      t.timestamps null: false
    end
  end
end
