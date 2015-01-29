class CreateLivraisonlogs < ActiveRecord::Migration
  def change
    create_table :livraisonlogs do |t|
      t.datetime :date_liv
      t.references :achat, index: true
      t.references :produit, index: true
      t.decimal :qte
      t.references :vente, index: true
      t.string :etat
      t.references :user, index: true

      t.timestamps
    end
  end
end
