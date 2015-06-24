class ChangeCollunmsNameTemaFromProposta < ActiveRecord::Migration
  def change
    rename_column :proposta, :tema_1_id, :tema_principal_id
    rename_column :proposta, :tema_2_id, :tema_opcional_id
  end
end
