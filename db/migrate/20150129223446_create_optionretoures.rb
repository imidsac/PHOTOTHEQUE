class CreateOptionretoures < ActiveRecord::Migration
  def change
    create_table :optionretoures do |t|
      t.string :name
      t.text :description
      t.string :etat, limit: 10, default: 'a' #actif
      t.references :user, index: true

      t.timestamps
    end
  end
end
