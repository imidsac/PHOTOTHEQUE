class CreateLivraisonlogs < ActiveRecord::Migration
  def change
    create_table :livraisonlogs do |t|
      t.datetime :date_liv
      t.references :achat, index: true
      t.references :article, index: true
      t.references :cadre, index: true
      t.decimal :qte
      t.references :vente, index: true
      t.string :type_liv, limit:10, null: false
      t.string :etat
      t.references :user, index: true

      t.timestamps
    end
  end
end
