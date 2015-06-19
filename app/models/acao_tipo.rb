# -*- encoding : utf-8 -*-
class AcaoTipo < ActiveRecord::Base


	APOIAR_ID = 1
	VETAR_ID = 2
	CRIAR_ID = 3

	def self.getApoiar
		AcaoTipo.find_by_id( APOIAR_ID)
	end

	def self.getVetar
		AcaoTipo.find_by_id( VETAR_ID)
	end

	def self.getCriar
		AcaoTipo.find_by_id( CRIAR_ID)
	end

end
