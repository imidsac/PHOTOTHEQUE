class CreateTcoffres < ActiveRecord::Migration
  def change
    create_table :tcoffres do |t|
      t.datetime :date_tc
      t.string :beneficier
      t.string :type_tc

      t.timestamps
    end
  end
end
