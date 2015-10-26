class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :image
      t.string :bio
      t.string :website
      t.string :token
      t.string :uid

      t.timestamps null: false
    end
  end
end
