class CreateCaisses < ActiveRecord::Migration
  def change
    create_table :caisses do |t|
      t.decimal :paiement, default: 0
      t.decimal :font, default: 0

      t.timestamps
    end
  end
end
