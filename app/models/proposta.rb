class Proposta < ActiveRecord::Base
  belongs_to :user
  has_many :votos
end
