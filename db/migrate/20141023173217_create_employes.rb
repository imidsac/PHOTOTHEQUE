class CreateEmployes < ActiveRecord::Migration
  def change
    create_table :employes do |t|
      t.string :nom
      t.string :prenom
      t.string :sexe
      t.string :phone
      t.text :address
      t.string :email
      t.string :compte_banc
      t.decimal :salaireb, default: 0
      t.string :type_em
      t.date :date_recru
      t.references :user, index: true

      t.timestamps
    end
  end
end
