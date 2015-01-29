class CreateDepenses < ActiveRecord::Migration
  def change
    create_table :depenses do |t|
      t.references :categoriedep, index: true, default: -1
      t.references :employe, index: true, default: -1
      t.string :beneficiere, default: 'No'
      t.datetime :date_dep
      t.string :description
      t.decimal :montant
      t.decimal :tva, default: 0
      t.string :etat_dep, default: 'n'
      t.references :user, index: true

      t.timestamps
    end
  end
end
