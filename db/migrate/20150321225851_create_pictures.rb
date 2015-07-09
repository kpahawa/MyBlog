class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :description
      t.string :url
      t.datetime :datetime

      t.timestamps
    end
  end
end
