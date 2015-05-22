class CreateVetos < ActiveRecord::Migration
  def change
    create_table :vetos do |t|
      t.string :descricao
      t.references :user, index: true
      t.references :proposta, index: true

      t.timestamps
    end
  end
end
