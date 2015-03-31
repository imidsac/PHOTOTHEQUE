class CreatePrestations < ActiveRecord::Migration
  def change
    create_table :prestations do |t|
      t.references :client, index: true, default: -1
      t.string :client_libre, default: 'No'
      t.references :employe, index: true, default: -1
      t.string :type_pr, limit:1, default: 's'
      t.string :etat_prestation, limit: 1, default: 'n'
      t.decimal :somme, default: 0
      t.decimal :payee, default: 0
      t.decimal :remise, default: 0
      t.decimal :tva, default: 0
      t.decimal :avoir, default: 0
      t.decimal :asomme, default: 0
      t.decimal :apayee, default: 0
      t.string :num_pr, limit: 30
      t.string :num, limit: 10
      t.string :valide, default: 'n'
      t.decimal :avoir, default: 0
      t.references :user, index: true
      t.datetime :date_prestation
      t.datetime :date_retoure

      t.timestamps
    end
  end
end
