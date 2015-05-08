# -*- encoding : utf-8 -*-
class CreateAcaos < ActiveRecord::Migration
  def change
    create_table :acaos do |t|
      t.references :user, index: true
      t.references :acao_tipo, index: true
      t.references :proposta, index: true

      t.timestamps
    end
  end
end
