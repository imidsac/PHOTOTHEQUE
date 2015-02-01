class CreatePaiements < ActiveRecord::Migration
  def change
    create_table :paiements do |t|
      t.references :banque, index: true, default: -1        #
      t.string :type_paiement, limit: 10, null: false
      t.references :boutique, index: true, default: -1
      t.references :client, index: true, default: -1
      t.references :vente, index: true, default: -1
      t.references :prestation, index: true, default: -1
      t.references :achat, index: true, default: -1
      t.references :fournisseur, index: true, default: -1
      t.references :employe, index: true
      t.datetime :datepaiement
      t.string :motif
      t.decimal :montant, default: 0
      t.string :etat
      t.references :user, index: true

      t.timestamps
    end
  end
end
