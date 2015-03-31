class CreateEmployes < ActiveRecord::Migration
  def change
    create_table :employes do |t|
      t.string :nom
      t.string :prenom
      t.string :sexe, limit:1, default: 'm'
      t.string :phone
      t.text :address
      t.string :email
      t.string :compte_banc
      t.decimal :salaireb, default: 0
      t.string :type_em, limit:1, default: 'r'
      t.date :date_recru
      t.string :etat, limit: 10, default: 'a' #actif
      t.references :user, index: true

      t.timestamps
    end
  end
end
