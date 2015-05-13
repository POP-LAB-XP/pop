# -*- encoding : utf-8 -*-
class AddReferencesTemaProposta2 < ActiveRecord::Migration
  def change
  	  	    add_reference :proposta, :tema_2
  end
end
