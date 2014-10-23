class CreateCadres < ActiveRecord::Migration
  def change
    create_table :cadres do |t|
      t.string :numerobaguete, limit: 30
      t.text :info

      t.timestamps
    end
  end
end
