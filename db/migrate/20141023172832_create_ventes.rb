class CreateVentes < ActiveRecord::Migration
  def change
    create_table :ventes do |t|
      t.references :boutique, index: true, default: -1
      t.references :client, index: true, default: -1
      t.string :client_libre, default: 'No'
      t.datetime :date_vente
      t.string :etat_vente, limit: 1
      t.decimal :somme, default: 0
      t.decimal :payee, default: 0
      t.string :type_ve, limit: 1, default: 'A'
      t.string :etat_vente, limit: 1, default: 'n'
      t.string :num_ve

      t.timestamps
    end
  end
end
