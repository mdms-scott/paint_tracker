class CreateMinis < ActiveRecord::Migration
  def change
    create_table :minis do |t|
      t.integer :user_id
      t.string :name
      t.integer :points

      t.timestamps
    end
  end
end
