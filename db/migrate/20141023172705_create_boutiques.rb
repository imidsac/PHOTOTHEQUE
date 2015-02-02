class CreateBoutiques < ActiveRecord::Migration
  def change
    create_table :boutiques do |t|
      t.string :name, null: false
      t.string :phone
      t.text :address
      t.references :user, index: true
      t.string :etat, limit: 10, default: 'a' #actif

      t.timestamps
    end
  end
end
