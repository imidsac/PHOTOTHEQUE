class CreateFournisseurs < ActiveRecord::Migration
  def change
    create_table :fournisseurs do |t|
      t.string :name_company
      t.string :nom
      t.string :prenom
      t.string :phone
      t.text :address
      t.string :email
      t.string :codefournisseur
      t.string :etat, limit: 10, default: 'a' #actif
      t.references :user, index: true

      t.timestamps
    end
    add_index :fournisseurs, :codefournisseur,                unique: true
  end
end
