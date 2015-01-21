class CreatePaiements < ActiveRecord::Migration
  def change
    create_table :paiements do |t|
      t.references :banque, index: true, default: -1        #
      t.string :type_paiement, limit: 10, default: 'p'
      t.references :boutique, index: true
      t.references :client, index: true
      t.references :vente, index: true
      t.references :prestation, index: true
      t.references :achat, index: true
      t.references :fournisseur, index: true
      t.references :employe, index: true
      t.datetime :datepaiement
      t.string :motif
      t.decimal :montant, default: 0
      t.string :etat
      t.timestamps
    end
  end
end
