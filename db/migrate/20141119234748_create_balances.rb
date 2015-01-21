class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.integer :exercice
      t.integer :mois
      t.decimal :achats, default: 0
      t.decimal :atva, default: 0
      t.decimal :depenses, default: 0
      t.decimal :dtva, default: 0
      t.decimal :ventes, default: 0
      t.decimal :vtva, default: 0
      t.decimal :prestations, default: 0
      t.decimal :vtva, default: 0
      t.decimal :tva_net, default: 0

      t.timestamps
    end
  end
end
