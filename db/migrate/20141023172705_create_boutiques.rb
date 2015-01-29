class CreateBoutiques < ActiveRecord::Migration
  def change
    create_table :boutiques do |t|
      t.string :name, null: false
      t.string :phone
      t.text :address
      t.references :user, index: true

      t.timestamps
    end
  end
end
