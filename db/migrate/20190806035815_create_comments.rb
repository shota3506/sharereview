class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :thesis
      t.references :user
      t.text :text, null: false
      t.timestamps
    end
  end
end
