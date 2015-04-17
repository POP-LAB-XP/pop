class AcaosController < ApplicationController
 
  # POST /resource
  def create
    user = User.find_by_id(params[:user])
    if user.count_user_actions >= 8
          flash[:notice] = "Limite de ações atingido!"
    else
      @acao = Acao.new(params[:acao])
  end
  protected
end
