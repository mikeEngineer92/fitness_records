class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.decimal :weight
      t.integer :rep
      t.integer :exercise_id

      t.timestamps
    end
  end
end
