class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title, null: false, unique: true
      t.text :description, null: false
      #t.text :description, null: false, index: { unique: true }
      #t.index :title
      t.integer :owner_id, null: false, unique: true
      
    end

    add_index :subs, :title
    add_index :subs, :owner_id
  end
end
