class RemoveTemasIdFromPropostas < ActiveRecord::Migration
  def change
  	remove_column :proposta, :temas_id
  end
end
