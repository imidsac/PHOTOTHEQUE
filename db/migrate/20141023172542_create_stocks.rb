class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :cadre, index: true
      t.references :article, index: true
      t.decimal :stoc, default: 0

      t.timestamps
    end
  end
end
