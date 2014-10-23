class CreateTcaisses < ActiveRecord::Migration
  def change
    create_table :tcaisses do |t|
      t.datetime :date_tc
      t.string :crencier
      t.string :type_tc, limit: 1, default: 'p'

      t.timestamps
    end
  end
end
