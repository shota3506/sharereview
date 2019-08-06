class CreateConferences < ActiveRecord::Migration[5.1]
  def change
    create_table :conferences do |t|
      t.string :name, null: false
      t.string :description
      t.timestamps
    end
    add_index :conferences, :name, unique: true
  end
end
