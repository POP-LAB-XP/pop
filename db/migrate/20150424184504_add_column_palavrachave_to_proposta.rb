# -*- encoding : utf-8 -*-
class AddColumnPalavrachaveToProposta < ActiveRecord::Migration
  def change
  	add_column :proposta, :palavra_chave, :string, :limit => 32
  end
end
