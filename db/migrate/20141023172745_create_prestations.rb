class CreatePrestations < ActiveRecord::Migration
  def change
    create_table :prestations do |t|
      t.references :client, index: true
      t.references :employe, index: true
      t.datetime :date_perstation
      t.string :etat_prestation, limit: 1
      t.decimal :somme, default: 0
      t.decimal :payee, default: 0

      t.timestamps
    end
  end
end
