class AddIndexTemasToPropostas < ActiveRecord::Migration
  def change
    add_index :proposta, :tema_principal_id
    add_index :proposta, :tema_opcional_id
  end
end
