# -*- encoding : utf-8 -*-
class SubPrefeitura < ActiveRecord::Base
	belongs_to :forum, :inverse_of => :sub_prefeituras
	has_many :users, :inverse_of => :sub_prefeitura

	def numero_de_usuarios
		self.users.count
	end

	def limite_usuario_atingido
		self.users.count == self.limite_de_usuarios
	end

end
