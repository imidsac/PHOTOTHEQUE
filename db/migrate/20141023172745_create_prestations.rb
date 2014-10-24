class CreatePrestations < ActiveRecord::Migration
  def change
    create_table :prestations do |t|
      t.references :client, index: true
      t.references :employe, index: true
      t.datetime :date_perstation
      t.string :etat_prestation, limit: 1, default: 'n'
      t.decimal :somme, default: 0
      t.decimal :payee, default: 0
      t.string :type_pr, default: 's'

      t.timestamps
    end
  end
end
