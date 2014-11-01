class CreatePrestationAttachments < ActiveRecord::Migration
  def change
    create_table :prestation_attachments do |t|
      t.references :prestation, index: true
      t.string :photo

      t.timestamps
    end
  end
end
