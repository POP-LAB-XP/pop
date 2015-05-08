# -*- encoding : utf-8 -*-
class AddForumRefToSubPrefeituras < ActiveRecord::Migration
  def change
    add_reference :sub_prefeituras, :forum, index: true
  end
end
