class AddReferencesTemaProposta1 < ActiveRecord::Migration
  def change
  	    add_reference :proposta, :tema_1
  end
end
