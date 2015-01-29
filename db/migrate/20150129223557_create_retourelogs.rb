class CreateRetourelogs < ActiveRecord::Migration
  def change
    create_table :retourelogs do |t|
      t.datetime :date_re
      t.references :produit, index: true
      t.decimal :qte
      t.references :optionretoure, index: true
      t.references :achat, index: true
      t.references :vente, index: true
      t.string :motif
      t.references :user, index: true

      t.timestamps
    end
  end
end
