class CreateBanques < ActiveRecord::Migration
  def change
    create_table :banques do |t|
      t.string :nom
      t.string :compte
      t.decimal :solde

      t.timestamps
    end
  end
end
