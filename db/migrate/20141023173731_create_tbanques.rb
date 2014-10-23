class CreateTbanques < ActiveRecord::Migration
  def change
    create_table :tbanques do |t|
      t.references :banque, index: true
      t.string :type_rv, limit: 1, default: 'v'
      t.decimal :montant, default: 0
      t.string :porteur

      t.timestamps
    end
  end
end
