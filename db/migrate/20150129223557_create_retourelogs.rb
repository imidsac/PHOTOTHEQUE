class CreateRetourelogs < ActiveRecord::Migration
  def change
    create_table :retourelogs do |t|
      t.string :type_re, limit: 10, null: false
      t.datetime :date_re
      t.references :article, index: true
      t.references :cadre, index: true
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
