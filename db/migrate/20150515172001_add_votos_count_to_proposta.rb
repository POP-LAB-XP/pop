class AddVotosCountToProposta < ActiveRecord::Migration
  def change
  	add_column :proposta, :votos_count, :integer, default: 0


	Proposta.reset_column_information

	Proposta.all.each do |proposta|
	  Proposta.update_counters(proposta.id, :votos_count => proposta.votos.length)
	end

  end
end
