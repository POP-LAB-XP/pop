class VotosController < ApplicationController
  def create
    proposta = Proposta.find_by_id(params[:proposta_id])

    if not proposta.present? 
      flash[:warning] = "Proposta inválida!"
    elsif current_user.limite_acoes_atingido
      flash[:warning] = "Limite de ações atingido!"
    elsif current_user.usuario_realizou_acao_hoje( proposta)
      flash[:warning] = "Você já apoiou essa proposta hoje!"
    elsif not proposta.esta_ativa
      flash[:warning] = "Você não pode apoiar uma proposta vetada!"
    else
      Acao.insere_acao( AcaoTipo.getApoiar, proposta, current_user)
      Voto.insere_voto(current_user, proposta)
      flash[:notice] = "Voto efetuado com sucesso!"
    end
    redirect_to :back
  end
end
