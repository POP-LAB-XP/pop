# -*- encoding : utf-8 -*-
class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    super do |resource|
        subPrefeitura = SubPrefeitura.find_by_codigo(params[:codigo])
        unless subPrefeitura.present?
          flash[:alert] = "Código de subprefeitura inválido!"
        else
          if not subPrefeitura.limite_usuario_atingido
            resource.sub_prefeitura = subPrefeitura
            resource.save
          else
            flash[:alert] = "O limite de usuários dessa subprefeitura atingido!"
          end
        end
    end
  end

end
