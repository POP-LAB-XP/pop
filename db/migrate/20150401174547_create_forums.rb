# -*- encoding : utf-8 -*-
class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :nome

      t.timestamps
    end
  end
end
