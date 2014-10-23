class CreateAlignes < ActiveRecord::Migration
  def change
    create_table :alignes do |t|
      t.references :achat, index: true
      t.decimal :qte, default: 0
      t.decimal :qtelivre, default: 0
      t.decimal :montant, default: 0
      t.string :etat, limit: 1

      t.timestamps
    end
  end
end
