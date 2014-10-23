class CreatePrestationlignes < ActiveRecord::Migration
  def change
    create_table :prestationlignes do |t|
      t.references :prestation, index: true
      t.decimal :qte, default: 0
      t.decimal :qtelivre, default: 0
      t.decimal :montant, default: 0
      t.integer :numero_prise, default: 0
      t.boolean :type_pl
      t.string :etat, limit: 1

      t.timestamps
    end
  end
end
