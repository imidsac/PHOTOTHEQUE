class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :fournisseur, index: true
      t.string :name, null: false
      t.string :reference
      t.string :num, limit: 10
      t.string :codearticle
      t.decimal :stock, default: 0
      t.decimal :vstock, default: 0
      t.decimal :dstock, default: 0
      t.decimal :EnCommande, default: 0
      t.decimal :pachat, default: 0
      t.decimal :previen, default: 0
      t.decimal :pdetail, default: 0
      t.decimal :pgros, default: 0
      t.decimal :pourcent_pdetail, default: 0
      t.decimal :pourcent_pgros, default: 0
      t.string :niveau, limit: 30, default: 'Originale' #actif
      t.string :etat, limit: 10, default: 'a' #actif
      t.references :user, index: true

      t.timestamps
    end
    add_index :articles, :codearticle, unique: true
  end
end
