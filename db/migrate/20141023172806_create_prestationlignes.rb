class CreatePrestationlignes < ActiveRecord::Migration
  def change
    create_table :prestationlignes do |t|
      t.references :prestation, index: true
      t.decimal :qte, default: 0
      t.decimal :qtelivre, default: 0
      t.decimal :montant, default: 0
      t.integer :numero_prise, default: 0
      t.string :type_pl, limit: 2, default: 'sp'
      t.string :etat, limit: 1, default: 'n'

      t.timestamps
    end
  end
end
