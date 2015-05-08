# -*- encoding : utf-8 -*-
class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
   super do |resource|
        subPrefeitura = SubPrefeitura.find_by_codigo(params[:codigo])
        if not subPrefeitura.limite_usuario_atingido
          resource.sub_prefeitura = subPrefeitura
          resource.save
	  p resource.errors
        else
          flash[:notice] = "Limite de usuários atingido!"
        end
    end
 end

  protected

end
