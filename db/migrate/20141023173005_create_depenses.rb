class CreateDepenses < ActiveRecord::Migration
  def change
    create_table :depenses do |t|
      t.string :description
      t.references :categoriedep, index: true
      t.string :montant, default: 0
      t.string :etat_dep, limit: 1, default: 'i'

      t.timestamps
    end
  end
end
