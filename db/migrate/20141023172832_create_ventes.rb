class CreateVentes < ActiveRecord::Migration
  def change
    create_table :ventes do |t|
      t.references :boutique, index: true, default: -1
      t.references :client, index: true, default: -1
      t.string :client_libre, default: 'No'
      t.decimal :somme, default: 0
      t.decimal :payee, default: 0
      t.decimal :remise, default: 0
      t.decimal :tva, default: 0
      t.decimal :avoir, default: 0
      t.decimal :asomme, default: 0
      t.decimal :apayee, default: 0
      t.string :num_ve, limit: 30
      t.string :num, limit: 10
      t.string :valide, default: 'n'
      t.decimal :avoir, default: 0
      t.string :type_ve, limit: 1, default: 'A'
      t.string :etat_vente, limit: 1, default: 'n'
      t.references :user, index: true
      t.datetime :date_vente
      t.datetime :date_retoure

      t.timestamps
    end
  end
end
