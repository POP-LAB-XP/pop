class CreateTemaProposta < ActiveRecord::Migration
  def change
    create_table :tema_proposta do |t|
      t.references :tema, index: true
      t.references :proposta, index: true

      t.timestamps
    end
  end
end
