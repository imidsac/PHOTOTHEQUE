class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.integer :exercice
      t.integer :mois
      t.decimal :achats
      t.decimal :depenses
      t.decimal :ventes
      t.decimal :prestations
      t.decimal :tva

      t.timestamps
    end
  end
end
