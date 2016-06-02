class CreateSnipits < ActiveRecord::Migration
  def change
    create_table :snipits do |t|
      t.integer :event_id
      t.text :description

      t.timestamps null: false
    end
  end
end
