class CreateBanques < ActiveRecord::Migration
  def change
    create_table :banques do |t|
      t.string :nom

      t.timestamps
    end
  end
end
