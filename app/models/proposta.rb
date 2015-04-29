class Proposta < ActiveRecord::Base
  belongs_to :user
  has_many :votos
  validates :descricao, length:{maximum: 255}, :presence => true
  validates :palavra_chave, length:{maximum: 32}
  validates :user, :presence => true

  belongs_to :tema_1, :class_name => "Tema"
  belongs_to :tema_2, :class_name => "Tema"

  validates :tema_1, :presence => true

  def self.order_por_votos
	#Proposta.all.sort{|x| x.votos.count}
	Proposta.all.joins("LEFT JOIN votos ON votos.proposta_id = proposta.id")
				.group("proposta.id, votos.proposta_id")
				.order("count(votos.proposta_id) DESC")
  end
end
