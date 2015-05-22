class AddStatusToProposta < ActiveRecord::Migration
  def change
    add_column :proposta, :status, :integer
  end
end
