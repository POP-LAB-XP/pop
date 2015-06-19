class VetosController < ApplicationController
  def new
  	@veto = Veto.new
  	@veto.proposta = Proposta.find_by_id(params[:proposta_id])
  end

  def create
  	@veto = Veto.create(veto_params)
	@veto.user_id = current_user.id
	if @veto.save
		@veto.veta_proposta
		redirect_to @veto	
	else
		flash[:warning] = "Não foi possível vetar a proposta!"
		redirect_to :action => 'new', :proposta_id => @veto.proposta_id
	end
  end

  def show
  	@veto = Veto.find_by_id(params[:id])

    unless @veto.present?
      render :text => 'Not Found', :status => '404'
    end
  end

  private
    def veto_params
      params.require(:veto).permit(:descricao, :proposta_id, :proposta)
    end

end
