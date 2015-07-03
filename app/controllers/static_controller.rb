# -*- encoding : utf-8 -*-
class StaticController < ApplicationController
  def welcome
    render layout: 'application_sem_navbar'
  end

  def termos_de_uso_sem_navbar
    render layout: 'application_sem_navbar'
  end
end
