class CreateRetourelogs < ActiveRecord::Migration
  def change
    create_table :retourelogs do |t|
      t.string :type_re, limit: 10, null: false
      t.references :article, index: true, default: -1
      t.references :cadre, index: true, default: -1
      t.decimal :qte, default: 0
      t.decimal :prix_u, default: 0
      t.decimal :montant, default: 0
      t.references :optionretoure, index: true, null: false
      t.references :achat, index: true, default: -1
      t.references :vente, index: true, default: -1
      t.references :prestation, index: true, default: -1
      t.string :motif
      t.references :user, index: true
      t.datetime :date_re

      t.timestamps
    end
  end
end
