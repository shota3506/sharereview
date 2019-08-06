class CreateTheses < ActiveRecord::Migration[5.1]
  def change
    create_table :theses do |t|
      t.references :conference
      t.string :title, null: false
      t.text :abstract
      t.string :url
      t.timestamps
    end
    add_index :theses, :title, unique: true
  end
end
