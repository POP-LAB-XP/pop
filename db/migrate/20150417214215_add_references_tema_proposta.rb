class AddReferencesTemaProposta < ActiveRecord::Migration
  def change
  	add_reference :tema, :tema_propostas, index: true
  	add_reference :proposta, :tema_propostas, index: true
  end
end
