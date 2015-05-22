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
		if @proposta.save
			acao_criar = AcaoTipo.getCriar
			insere_acao( acao_criar, @proposta)
			insere_voto( @proposta)
			redirect_to propostas_path
		else
			flash[:notice] = "Não foi possível criar proposta!"
			redirect_to new_proposta_path 
		end
	end


	def new_voto
		redirect_to :back
		proposta = Proposta.find_by_id(params[:id])
		if current_user.limite_acoes_atingido
			flash[:notice] = "Limite de ações atingido!"
		elsif current_user.usuario_realizou_acao_hoje( proposta)
			flash[:notice] = "Você já apoiou essa proposta hoje!"
		else
			acaoApoio = AcaoTipo.getApoiar
			Acao.insere_acao( acaoApoio, proposta,current_user)
			insere_voto( proposta)
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

    

  def insere_voto( proposta )	
	Voto.create({
        user: current_user,
	    proposta: proposta
	})
    end
end



