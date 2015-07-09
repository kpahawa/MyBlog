class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :subscribed
      t.text :message

      t.timestamps
    end
  end
end
