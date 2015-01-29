class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :fournisseur, index: true
      t.string :name, null: false
      t.string :reference
      t.decimal :stock, default: 0
      t.decimal :vstock, default: 0
      t.decimal :dstock, default: 0
      t.deciaml :EnCommande, default: 0
      t.decimal :pachat, default: 0
      t.decimal :pdetail, default: 0
      t.decimal :pgros, default: 0
      t.string :etat, limit: 1, default: 'a'
      t.references :user, index: true

      t.timestamps
    end
  end
end
