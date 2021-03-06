class CreatePrestations < ActiveRecord::Migration
  def change
    create_table :prestations do |t|
      t.references :client, index: true, default: -1
      t.string :client_libre, default: 'No'
      t.references :employe, index: true, default: -1
      t.datetime :date_prestation
      t.string :etat_prestation, limit: 1, default: 'n'
      t.decimal :somme, default: 0
      t.decimal :payee, default: 0
      t.decimal :tva, default: 0
      t.string :type_pr, limit:1, default: 's'
      t.string :num_pr, limit: 30
      t.string :valide, limit: 1, default: 'n'
      t.integer :retoure, default: 0
      t.references :user, index: true

      t.timestamps
    end
  end
end
