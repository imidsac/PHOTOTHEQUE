class CreateAchats < ActiveRecord::Migration
  def change
    create_table :achats do |t|
      t.references :fournisseur, index: true, default: -1
      t.string :fournisseur_libre
      t.datetime :date_achat
      t.string :type_ac, limit: 1, default: 'A'
      t.decimal :somme, default: 0
      t.decimal :payee, default: 0
      t.string :etat_achat, limit: 1, default: 'n'

      t.timestamps
    end
  end
end
