class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score
      t.integer :user_id
      t.integer :pic_num
      t.timestamps
    end
  end
end
