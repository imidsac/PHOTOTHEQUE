class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nom, null: false, default: ""
      t.string :prenom, null: false, default: ""
      t.string :sexe
      t.string :nationalite
      t.string :ville, null: false, default: "Bamako"
      t.string :region, null: false, default: "Bamako"
      t.date :date_nai
      t.string :lieu_nai
      t.string :phone, null: false, default: ""
      t.text :address
      t.string :email
      t.string :codeclient
      t.string :type_cl, limit:1, default: 'o'
      t.string :etat, limit: 10, default: 'a' #actif
      t.decimal :points, default: 0 #actif
      t.string :num, limit: 10
      t.references :user, index: true
      t.date :date_ins

      t.timestamps
    end
    add_index :clients, :codeclient,                unique: true
  end
end
