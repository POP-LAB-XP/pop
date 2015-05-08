# -*- encoding : utf-8 -*-
class CreateAcaoTipos < ActiveRecord::Migration
  def change
    create_table :acao_tipos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
