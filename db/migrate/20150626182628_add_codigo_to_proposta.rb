class AddCodigoToProposta < ActiveRecord::Migration
  def change
    add_column :proposta, :codigo, :string, index: true
  end
end
