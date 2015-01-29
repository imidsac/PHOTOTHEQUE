class CreateCategoriedeps < ActiveRecord::Migration
  def change
    create_table :categoriedeps do |t|
      t.string :name, null: false
      t.string :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
