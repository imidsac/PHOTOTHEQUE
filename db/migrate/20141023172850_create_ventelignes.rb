class CreateVentelignes < ActiveRecord::Migration
  def change
    create_table :ventelignes do |t|
      t.references :vente, index: true
      t.references :article, index: true, default: -1
      t.references :cadre, index: true, default: -1
      t.decimal :qte, default: 0
      t.decimal :qtelivre, default: 0
      t.decimal :prix_u, default: 0
      t.decimal :montant, default: 0
      t.string :etat, limit: 1, default: 'n'

      t.timestamps
    end
  end
end
