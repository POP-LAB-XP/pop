class AddCidadeToSubprefeitura < ActiveRecord::Migration
  def change
	add_column :sub_prefeituras, :cidade, :string
  end
end
