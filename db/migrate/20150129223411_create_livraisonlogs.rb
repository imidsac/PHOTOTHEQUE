class CreateLivraisonlogs < ActiveRecord::Migration
  def change
    create_table :livraisonlogs do |t|
      t.references :achat, index: true, default: -1
      t.references :article, index: true, default: -1
      t.references :cadre, index: true, default: -1
      t.decimal :qte, default: 0
      t.references :vente, index: true, default: -1
      t.references :prestation, index: true, default: -1
      t.string :type_liv, limit:10, null: false
      t.string :etat
      t.references :user, index: true
      t.datetime :date_liv

      t.timestamps
    end
  end
end
