class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

  # POST /resource
  def create
   super do
        subPrefeitura = SubPrefeitura.find_by_codigo(params[:codigo])

        if not subPrefeitura.limite_usuario_atingido
          user.sub_prefeitura = subPrefeitura
          resource.save
        else
          flash[:notice] = "Limite de usuários atingido!"
        end
    end
   super
 end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:codigo) }
    end
end
