class CreateCadres < ActiveRecord::Migration
  def change
    create_table :cadres do |t|
      t.string :numerobaguete, limit: 30
      t.text :info
      t.decimal :stock, default: 0
      t.decimal :vstock, default: 0
      t.decimal :pachat, default: 0
      t.decimal :pdetail, default: 0
      t.decimal :pgros, default: 0
      t.string :etat, limit: 1, default: 'a'

      t.timestamps
    end
  end
end
