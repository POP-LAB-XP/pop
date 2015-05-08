# -*- encoding : utf-8 -*-
class CreateVotos < ActiveRecord::Migration
  def change
    create_table :votos do |t|
      t.references :proposta, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
