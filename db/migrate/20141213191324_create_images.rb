class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :url
      t.string :city_name
    end
  end
end
