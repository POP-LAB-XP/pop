# -*- encoding : utf-8 -*-
class StaticController < ApplicationController
	def welcome
		render layout: 'application_sem_navbar'
	end
end
