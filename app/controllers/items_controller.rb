class ItemsController < ApplicationController
  def index
    @available_items = Item.where(:giver => ["",nil]).all
    @reserved_items = Item.where("giver <> ''").all
  end
end
