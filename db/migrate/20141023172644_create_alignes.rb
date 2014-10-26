class CreateAlignes < ActiveRecord::Migration
  def change
    create_table :alignes do |t|
      t.references :achat, index: true
      t.references :article, index: true
      t.references :cadre, index: true
      t.decimal :qte, default: 0
      t.decimal :qtelivre, default: 0
      t.decimal :prix_u, default: 0
      t.decimal :montant, default: 0
      t.string :etat, limit: 1,  default: 'n'

      t.timestamps
    end
  end
end
