class CreateAchats < ActiveRecord::Migration
  def change
    create_table :achats do |t|
      t.references :fournisseur, index: true, default: -1
      t.string :fournisseur_libre, default: 'No'
      t.string :type_ac, limit: 1, default: 'A'
      t.decimal :somme, default: 0
      t.decimal :somme1, default: 0
      t.decimal :payee, default: 0
      t.decimal :payee1, default: 0
      t.decimal :depense, default: 0
      t.decimal :depense1, default: 0
      t.decimal :remise, default: 0
      t.decimal :tva, default: 0
      t.decimal :avoir, default: 0
      t.decimal :asomme, default: 0
      t.decimal :apayee, default: 0
      t.string :etat_achat, limit: 1, default: 'n'
      t.string :num_ac, limit: 30
      t.string :num, limit: 10
      t.string :valide, limit: 1, default: 'n'
      t.references :monetaire, index: true, default: -1
      t.references :user, index: true
      t.datetime :date_achat
      t.datetime :date_retoure


      t.timestamps
    end
  end
end
