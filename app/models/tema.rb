class Tema < ActiveRecord::Base
	has_many :tema_propostas
	has_many :propostas, through: :tema_propostas
end
