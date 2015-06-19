# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "application_sem_navbar"
    else
      "application"
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :codigo
  end

end
