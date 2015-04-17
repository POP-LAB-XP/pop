class Proposta < ActiveRecord::Base
  belongs_to :user
  has_many :tema_propostas
  has_many :temas, through: :tema_propostas
  has_many :votos
  validates :descricao, length:{maximum: 255}, :presence => true

  def self.order_por_votos
	#Proposta.all.sort{|x| x.votos.count}
	Proposta.all.joins("LEFT JOIN votos ON votos.proposta_id = proposta.id")
				.group("proposta.id, votos.proposta_id")
				.order("count(votos.proposta_id) DESC")
  end
end
