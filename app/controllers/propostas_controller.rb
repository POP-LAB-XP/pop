class PropostasController < ApplicationController

	def index
		@list = Proposta.order_por_votos
	end


	def new
		@lista_temas = Tema.all
		@proposta = Proposta.new
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
		end
	end

	def new_voto
		redirect_to :back
		if current_user.limite_acoes_atingido
			flash[:notice] = "Limite de acoes atingido!"
		else
			acaoApoio = AcaoTipo.getApoiar
			proposta = Proposta.find_by_id(params[:id])
			insere_acao( acaoApoio, proposta)
			insere_voto( proposta)
		end
	end

	private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def proposta_params
      params.require(:proposta).permit(:descricao, :palavra_chave, :tema_1, :tema_2, :tema_1_id, :tema_2_id)
    end

    def insere_acao( acao_tipo, proposta )	
	Acao.create({
	    user:current_user,
	    proposta: proposta,
            acao_tipo:acao_tipo	
	})
    end

    def insere_voto( proposta )	
	Voto.create({
            user: current_user,
	    proposta: proposta
	})
    end
end



