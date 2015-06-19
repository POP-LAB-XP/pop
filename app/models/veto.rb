class Veto < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposta

  validates :user, :presence => true
  validates :proposta, :presence => true, :uniqueness => true
  validates :descricao, length:{maximum: 140}, :presence => true
end
