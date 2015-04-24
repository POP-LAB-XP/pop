class PropostasController < ApplicationController
	def index
		@list = Proposta.order_por_votos
	end

	def new_voto
		redirect_to :back
		if current_user.limite_acoes_atingido
			flash[:notice] = "Limite de acoes atingido!"
		else
			acaoApoio = AcaoTipo.getApoiar
			proposta = Proposta.find_by_id(params[:id])
			acao = Acao.create({
				user:current_user,
				proposta: proposta,
				acao_tipo:acaoApoio
			})
			voto = Voto.create({
				user: current_user,
				proposta: proposta
			})
		end
	end
end



