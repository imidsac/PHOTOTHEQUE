class CreateBanques < ActiveRecord::Migration
  def change
    create_table :banques do |t|
      t.string :nom
      t.string :compte
      t.decimal :solde, default: 0
      t.decimal :font, default: 0

      t.timestamps
    end
  end
end
