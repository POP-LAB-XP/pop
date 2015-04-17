class TemaProposta < ActiveRecord::Base
  belongs_to :tema
  belongs_to :proposta
end
