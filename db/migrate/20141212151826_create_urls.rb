class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.text :url
      t.integer :city_id
      t.timestamps
    end
  end
end
