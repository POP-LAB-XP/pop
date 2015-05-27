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

    @user = User.new()
    if @user.save
      # Tell the UserMailer to send a welcome email after save
      PopMailer.termos_email(@user).deliver
    end

  end

  protected

end
