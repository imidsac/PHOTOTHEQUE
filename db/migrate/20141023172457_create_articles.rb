class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :reference
      t.decimal :stock, default: 0
      t.string :etat, limit: 1, default: 'a'

      t.timestamps
    end
  end
end
