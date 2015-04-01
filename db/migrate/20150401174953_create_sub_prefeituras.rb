class CreateSubPrefeituras < ActiveRecord::Migration
  def change
    create_table :sub_prefeituras do |t|
      t.string :nome
      t.string :codigo
      t.integer :limite_de_usuarios

      t.timestamps
    end
  end
end
