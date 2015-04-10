class Proposta < ActiveRecord::Base
  belongs_to :user
  has_many :votos, :counter_cache => true
  validates :descricao, length:{maximum: 255}, :presence => true
end
