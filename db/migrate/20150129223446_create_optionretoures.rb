class CreateOptionretoures < ActiveRecord::Migration
  def change
    create_table :optionretoures do |t|
      t.string :name
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
