# -*- encoding : utf-8 -*-
class PropostasController < ApplicationController

	def index
		#@list = Proposta.order_por_votos.page(params[:page]).per(5)
		@list = Proposta.order(:id).page(params[:page]).per(10)
	end


	def new
		@lista_temas = Tema.all
		@proposta = Proposta.new
	end

	def create
		@proposta = Proposta.create(proposta_params)
		@proposta.user_id = current_user.id
		if @proposta.save
			redirect_to propostas_path
		else
			flash[:notice] = "Não foi possível criar proposta!"
		end
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

	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def proposta_params
      params.require(:proposta).permit(:descricao, :palavra_chave, :tema_1, :tema_2, :tema_1_id, :tema_2_id, :page)
    end

end



