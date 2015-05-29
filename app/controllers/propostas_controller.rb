# -*- encoding : utf-8 -*-
class PropostasController < ApplicationController
	
	def index
		@list = Proposta.order_por_votos.page(params[:page]).per(10)
	end

	def new
		if current_user.limite_acoes_atingido
			redirect_to :back
			flash[:notice] = "Limite de ações atingido!"
		else
			@lista_temas = Tema.all
			@proposta = Proposta.new
		end
	end

	def create
		@proposta = Proposta.create(proposta_params)
		@proposta.user_id = current_user.id
		@proposta.status = 1
		if @proposta.save
			acao_criar = AcaoTipo.getCriar
			Acao.insere_acao( acao_criar, @proposta, current_user)
			Voto.insere_voto( current_user, @proposta)
			redirect_to propostas_path
		else
			flash[:notice] = "Não foi possível criar proposta!"
			redirect_to new_proposta_path 
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



