# -*- encoding : utf-8 -*-
class Acao < ActiveRecord::Base
 	belongs_to :user
 	belongs_to :acao_tipo
 	belongs_to :proposta

	before_validation :verifica_limite_acoes, :on => :create

	def verifica_limite_acoes
      	if self.user.limite_acoes_atingido
      		errors.add(:acao, "Limite de ações atingido!")
      	end
  end

  def self.insere_acao( acao_tipo, proposta, user )	
		Acao.create({
	    	user: user,
	    	proposta: proposta,
        acao_tipo: acao_tipo	
		})
  end

end
