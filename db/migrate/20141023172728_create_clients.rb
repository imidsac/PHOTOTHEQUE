class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nom, null: false
      t.string :prenom
      t.string :phone
      t.text :address
      t.string :email
      t.string :type_cl, limit:1, default: 'o'
      t.references :user, index: true

      t.timestamps
    end
  end
end
