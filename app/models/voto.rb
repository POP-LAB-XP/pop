# -*- encoding : utf-8 -*-
class Voto < ActiveRecord::Base
  belongs_to :proposta, :counter_cache => true
  belongs_to :user

  validate :proposta_valida 

  def proposta_valida
	if not self.proposta.present? 
		errors.add(:proposta, "Proposta inválida!")
	elsif not self.proposta.esta_ativa
		errors.add(:proposta, "Você não pode apoiar uma proposta vetada!")
	end  	
  end

  def self.insere_voto(user, proposta)	
	Voto.create({
        user: user,
	    proposta: proposta
	})
  end

end
