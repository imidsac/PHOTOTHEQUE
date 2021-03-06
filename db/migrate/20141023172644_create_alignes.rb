class CreateAlignes < ActiveRecord::Migration
  def change
    create_table :alignes do |t|
      t.references :achat, index: true
      t.references :article, index: true, default: -1
      t.references :cadre, index: true, default: -1
      t.decimal :qte, default: 0
      t.decimal :qtelivre, default: 0
      t.decimal :prix_u, default: 0
      t.decimal :prix_u1, default: 0
      t.decimal :montant, default: 0
      t.decimal :montant1, default: 0
      t.decimal :remise, default:0
      t.string :etat, limit: 1,  default: 'n'
      t.references :user, index: true

      t.timestamps
    end
  end
end
