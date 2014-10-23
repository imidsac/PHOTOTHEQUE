class CreateAchats < ActiveRecord::Migration
  def change
    create_table :achats do |t|
      t.references :fournisseur, index: true
      t.datetime :date_achat
      t.string :type
      t.decimal :somme, default: 0
      t.decimal :payee, default: 0
      t.string :etat_achat, limit: 1

      t.timestamps
    end
  end
end
