# -*- encoding : utf-8 -*-
class Proposta < ActiveRecord::Base
  belongs_to :user
  has_many :votos
  validates :descricao, length:{maximum: 255}, :presence => true

  belongs_to :tema_1, :class_name => "Tema"
  belongs_to :tema_2, :class_name => "Tema"

  def self.order_por_votos
    order('votos_count desc')
  end
end
