class CreateCoffres < ActiveRecord::Migration
  def change
    create_table :coffres do |t|
      t.decimal :paiement
      t.decimal :font

      t.timestamps
    end
  end
end
