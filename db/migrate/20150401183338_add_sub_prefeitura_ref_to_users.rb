# -*- encoding : utf-8 -*-
class AddSubPrefeituraRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :sub_prefeitura, index: true
  end
end
