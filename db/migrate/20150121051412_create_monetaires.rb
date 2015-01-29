class CreateMonetaires < ActiveRecord::Migration
  def change
    create_table :monetaires do |t|
      t.string :money
      t.string :code_money
      t.decimal :valeur
      t.references :user, index: true

      t.timestamps
    end
  end
end
