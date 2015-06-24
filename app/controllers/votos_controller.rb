class VotosController < ApplicationController
  before_filter :define_proposta


  def create	
  		if current_user.limite_acoes_atingido
			flash[:warning] = "Limite de ações atingido!"
		elsif current_user.usuario_realizou_acao_hoje(@proposta)
			flash[:warning] = "Você já apoiou essa proposta hoje!"
		else 	
			insere_acao_no_voto
		end
		redirect_to :back

  end


  private

  	def define_proposta
  		@proposta = Proposta.find_by_id(params[:proposta_id])
  	end 
  	
  	def insere_acao_no_voto
		Acao.insere_acao( AcaoTipo.getApoiar, @proposta, current_user)
		Voto.insere_voto(current_user, @proposta)
		flash[:notice] = "Voto efetuado com sucesso!"
  	end

end
