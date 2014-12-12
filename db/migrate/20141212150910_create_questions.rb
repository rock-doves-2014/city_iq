class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :city_id
      t.text :guess
      t.integer :score_id
      t.timestamps
    end
  end
end
