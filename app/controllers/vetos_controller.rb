class VetosController < ApplicationController
  def new
  end

  def create
  end

  def show
  	@veto = Veto.find_by_id(params[:id])
  end
end
