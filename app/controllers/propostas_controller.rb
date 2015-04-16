class PropostasController < ApplicationController
	def index
		@list = Proposta.order_por_votos
	end
end



