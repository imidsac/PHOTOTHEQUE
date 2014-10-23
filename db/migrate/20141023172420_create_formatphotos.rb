class CreateFormatphotos < ActiveRecord::Migration
  def change
    create_table :formatphotos do |t|
      t.string :dimention, limit: 20
      t.text :info

      t.timestamps
    end
  end
end
