class CreateProposta < ActiveRecord::Migration
  def change
    create_table :proposta do |t|
      t.string :descricao
      t.references :user, index: true

      t.timestamps
    end
  end
end
