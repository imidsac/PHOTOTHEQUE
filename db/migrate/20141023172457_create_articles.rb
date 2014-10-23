class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :reference
      t.string :etat, limit: 1, default: 'a'

      t.timestamps
    end
  end
end
