class CreatePaiements < ActiveRecord::Migration
  def change
    create_table :paiements do |t|
      t.references :vente, index: true
      t.references :client, index: true
      t.references :achat, index: true
      t.references :fournisseur, index: true
      t.datetime :datepaiement
      t.string :motif
      t.decimal :montant, default: 0

      t.timestamps
    end
  end
end
