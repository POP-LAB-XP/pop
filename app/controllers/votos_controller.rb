class VotosController < ApplicationController
  def create
		proposta = Proposta.find_by_id(params[:proposta_id])
		if current_user.limite_acoes_atingido
			flash[:notice] = "Limite de ações atingido!"
		elsif current_user.usuario_realizou_acao_hoje( proposta)
			flash[:notice] = "Você já apoiou essa proposta hoje!"
        elsif not proposta.esta_ativa
			flash[:notice] = "Você não pode apoiar uma proposta vetada!"
		else
			Acao.insere_acao( AcaoTipo.getApoiar, proposta, current_user)
			insere_voto(proposta)
		end
		redirect_to :back
  end

  def insere_voto(proposta)	
	Voto.create({
        user: current_user,
	    proposta: proposta
	})
  end

end