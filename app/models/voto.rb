# -*- encoding : utf-8 -*-
class Voto < ActiveRecord::Base
  belongs_to :proposta, :counter_cache => true
  belongs_to :user

  def self.insere_voto(user, proposta)	
	Voto.create({
        user: user,
	    proposta: proposta
	})
  end

end
