class CreateAchats < ActiveRecord::Migration
  def change
    create_table :achats do |t|
      t.references :fournisseur, index: true, default: -1
      t.string :fournisseur_libre, default: 'No'
      t.datetime :date_achat
      t.string :type_ac, limit: 1, default: 'A'
      t.decimal :somme, default: 0
      t.decimal :payee, default: 0
      t.decimal :tva, default: 0
      t.string :etat_achat, limit: 1, default: 'n'
      t.string :num_ac, limit: 30
      t.string :valide, limit: 1, default: 'n'
      t.references :monetaire, index: true, default: -1
      t.integer :retoure, default: 0
      t.references :user, index: true


      t.timestamps
    end
  end
end
