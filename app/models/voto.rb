class Voto < ActiveRecord::Base
  belongs_to :proposta
  belongs_to :user
end
