class CreateCadres < ActiveRecord::Migration
  def change
    create_table :cadres do |t|
      t.string :numerobaguete, limit: 30
      t.text :info
      t.string :etat, limit: 1, default: 'a'

      t.timestamps
    end
  end
end
