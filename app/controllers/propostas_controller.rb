class PropostasController < ApplicationController
	def index
		@list = Proposta.joins(:votos)
		.group("votos.proposta_id")
		.order("count(votos.proposta_id) desc")
	end
end



