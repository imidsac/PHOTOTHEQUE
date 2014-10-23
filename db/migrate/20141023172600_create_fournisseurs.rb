class CreateFournisseurs < ActiveRecord::Migration
  def change
    create_table :fournisseurs do |t|
      t.string :name_company
      t.string :nom
      t.string :prenom
      t.string :phone
      t.text :address
      t.string :email

      t.timestamps
    end
  end
end
