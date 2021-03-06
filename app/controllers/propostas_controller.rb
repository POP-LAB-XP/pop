# -*- encoding : utf-8 -*-
class PropostasController < ApplicationController

	def index
		#@list = Proposta.order_por_votos.page(params[:page]).per(10)
		@list = Proposta.order_por_votos.page(params[:page]).per(10)
	end

  	def meus_apoios 
    	@list = Kaminari.paginate_array(current_user.minhas_propostas_apoiadas).page(params[:page]).per(10)
  	end

	def new
		@proposta = Proposta.new
		@lista_temas = Tema.all

		if current_user.limite_acoes_atingido
			flash[:warning] = "Limite de ações atingido!"
		end
	end

	def create
		if current_user.limite_acoes_atingido
			flash[:warning] = "Proposta não foi criada. Limite de ações atingido!"
			redirect_to new_proposta_path 
		else
			@proposta = Proposta.create(proposta_params)
			@proposta.user_id = current_user.id
			@proposta.status = 1
			if @proposta.save
				acao_criar = AcaoTipo.getCriar
				Acao.insere_acao( acao_criar, @proposta, current_user)
				Voto.insere_voto( current_user, @proposta)
				redirect_to propostas_path
			else
				flash[:warning] = "Não foi possível criar proposta!"
				redirect_to new_proposta_path 
			end
		end
	end

	def toppop
		@list = (Proposta.order_por_votos)[0..9]
	end

	def novasdasemana
		@list_semana = (Proposta.order_mais_da_semana)[0..9]
	end

  	def top_subprefeitura 
    	@list = (current_user.sub_prefeitura.ordena_propostas_subprefeitura).page(params[:page]).per(10)
  	end

private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def proposta_params
      params.require(:proposta).permit(:descricao, :palavra_chave, :tema_principal, :tema_opcional, :tema_principal_id, :tema_opcional_id, :page)
    end
 end
